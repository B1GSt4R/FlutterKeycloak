import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:oauth2_test/config/global_config.dart';
import 'package:oauth2_test/ui/shared_widgets/layout_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void onLogin() async {
    // context.goNamed('dashboard');
    try {
      FlutterAppAuth appAuth = FlutterAppAuth();
      final tokenResponse = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          issuer: '$scheme$authHost/auth/realms/$realm',
          scopes: ['openid', 'profile'],
          allowInsecureConnections: true,
        ),
      );
      print(tokenResponse);
    } on FlutterAppAuthUserCancelledException catch (e) {
      print(e);
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
