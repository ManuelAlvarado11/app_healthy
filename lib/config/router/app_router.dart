import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // LOGIN
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    // REGISTER
    GoRoute(
      path: '/register',
      name: RegisterScreen.name,
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),

    // REDIRECT
    GoRoute(path: '/', redirect: (_, __) => '/login')
  ],
);
