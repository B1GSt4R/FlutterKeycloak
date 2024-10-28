import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oauth2_test/config/global_config.dart';
import 'package:oauth2_test/providers/person_provider.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void onLogin() async {
    try {
      String url = '$scheme$authHost/auth/realms/$realm';
      var issuer = await Issuer.discover(Uri.parse(url));
      client = Client(issuer, clientId, clientSecret: clientSecret);

      urlLauncher(String uri) async {
        if (!await launchUrl(Uri.parse(uri), mode: LaunchMode.inAppWebView)) {
          throw Exception('Could not launch $uri');
        }
      }

      var authenticator = Authenticator(client, scopes: scopes, urlLancher: urlLauncher);
      var c = await authenticator.authorize();
      closeInAppWebView();
      userInfo = await c.getUserInfo();
      final t = await c.getTokenResponse(true);
      token = t.accessToken ?? '';
      context.goNamed('dashboard');
      var tmp = ref.read(personProvider.notifier).getAsync();
    } catch (e) {
      print(e);
    }
  }

  void onRegister() {
    context.pushNamed('registration');
  }

  void onForget() {
    context.pushNamed('passwordforget');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      context: context,
      title: 'Login',
      child: Center(
        child: Column(
          children: [
            const Text('Login'),
            ElevatedButton.icon(
              onPressed: () => onLogin(),
              label: const Text('Anmelden'),
              icon: const Icon(CupertinoIcons.chevron_forward),
              iconAlignment: IconAlignment.end,
            ),
            ElevatedButton.icon(
              onPressed: onRegister,
              label: const Text('Registrieren'),
              icon: const Icon(CupertinoIcons.chevron_forward),
              iconAlignment: IconAlignment.end,
            ),
            ElevatedButton.icon(
              onPressed: onForget,
              label: const Text('Passwort vergessen'),
              icon: const Icon(CupertinoIcons.chevron_forward),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
