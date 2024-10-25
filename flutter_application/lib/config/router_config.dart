import 'package:oauth2_test/ui/screens/authentication/login/login_screen.dart';
import 'package:oauth2_test/ui/screens/authentication/password_forget/password_forget_screen.dart';
import 'package:oauth2_test/ui/screens/authentication/password_reset/password_reset_screen.dart';
import 'package:oauth2_test/ui/screens/authentication/registration/registration_screen.dart';
import 'package:oauth2_test/ui/screens/dashboard/dashboard_screen.dart';
import 'package:oauth2_test/ui/screens/person/detail/person_detail_screen.dart';
import 'package:oauth2_test/ui/screens/person/list/person_list_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: 'login',
    path: '/',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: 'registration',
    path: '/registration',
    builder: (context, state) => const RegistrationScreen(),
  ),
  GoRoute(
    name: 'passwordforget',
    path: '/passwordforget',
    builder: (context, state) => const PasswordForgetScreen(),
  ),
  GoRoute(
    name: 'passwordreset',
    path: '/passwordreset',
    builder: (context, state) => const PasswordResetScreen(),
  ),
  GoRoute(
    name: 'dashboard',
    path: '/dashboard',
    builder: (context, state) => const DashboardScreen(),
  ),
  GoRoute(
    name: 'persons',
    path: '/persons',
    builder: (context, state) {
      final search = state.pathParameters['search'];
      return PersonListScreen(search: search);
    },
    routes: [
      GoRoute(
        name: 'person-details',
        path: 'details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return PersonDetailScreen(id: int.parse(id ?? '0'));
        },
      ),
    ],
  ),
]);
