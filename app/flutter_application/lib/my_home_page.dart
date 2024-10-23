import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final host = '192.168.137.2';

  @override
  void initState() {
    super.initState();

    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: login,
        child: Icon(Icons.https),
      ),
    );
  }

  Future<void> login() async {
    try {
      final client = await createClient();
      var token = client.credentials.accessToken;
      var res = await client.get(Uri.parse('https://$host:7255/WeatherForecast'), headers: {'Authorization': 'Bearer $token'});
      var statuscode = res.statusCode;
      var data = res.body;
    } catch (ex) {
      print(ex);
    }
  }

  /// Either load an OAuth2 client from saved credentials or authenticate a new
  /// one.
  Future<oauth2.Client> createClient() async {
    final authorizationEndpoint = Uri.parse('http://$host:8090/realms/master/protocol/openid-connect/auth');
    final tokenEndpoint = Uri.parse('http://$host:8090/realms/master/protocol/openid-connect/token');

    // The authorization server will issue each client a separate client
    // identifier and secret, which allows the server to tell which client
    // is accessing it. Some servers may also have an anonymous
    // identifier/secret pair that any client may use.
    //
    // Note that clients whose source code or binary executable is readily
    // available may not be able to make sure the client secret is kept a
    // secret. This is fine; OAuth2 servers generally won't rely on knowing
    // with certainty that a client is who it claims to be.
    final identifier = 'flutter-client';
    // final secret = 'rsPckcrlmpAA5VeC8sbKIhUNiGWDCoHN';

    // This is a URL on your application's server. The authorization server
    // will redirect the resource owner here once they've authorized the
    // client. The redirection will include the authorization code in the
    // query parameters.
    final redirectUrl = Uri.parse('http://$host:8091/oauth2/callback');

    var grant = oauth2.AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      // secret: secret,
    );

    // A URL on the authorization server (authorizationEndpoint with some additional
    // query parameters). Scopes and state can optionally be passed into this method.
    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

    Uri? responseUrl = null;

    await Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) {
              // Redirect the resource owner to the authorization URL. Once the resource
              // owner has authorized, they'll be redirected to `redirectUrl` with an
              // authorization code. The `redirect` should cause the browser to redirect to
              // another URL which should also have a listener.
              return SafeArea(
                child: Container(
                  child: WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..loadRequest(Uri.parse(authorizationUrl.toString()))
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onNavigationRequest: (navigationRequest) {
                            if (navigationRequest.url.startsWith(redirectUrl.toString())) {
                              responseUrl = Uri.parse(navigationRequest.url);
                              print('Response URL: $responseUrl');
                              Navigator.pop(context);
                              return NavigationDecision.prevent;
                            }
                            return NavigationDecision.navigate;
                          },
                        ),
                      ),
                  ),
                ),
              );
            }));

    // Once the user is redirected to `redirectUrl`, pass the query parameters to
    // the AuthorizationCodeGrant. It will validate them and extract the
    // authorization code to create a new Client.
    var query = Uri.splitQueryString(responseUrl!.query);
    return grant.handleAuthorizationResponse(query);
  }
}
