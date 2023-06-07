import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

final authRouter = [
  // LOGIN
  GoRoute(
    path: LoginScreen.routeName,
    name: LoginScreen.routeName,
    builder: (context, state) => const LoginScreen(),
  ),

  // REGISTER
  GoRoute(
    path: RegisterScreen.routeName,
    name: RegisterScreen.routeName,
    builder: (context, state) => const RegisterScreen(),
  ),

  // FORGOT PASS
  GoRoute(
    path: ForgotPassScreen.routeName,
    name: ForgotPassScreen.routeName,
    builder: (context, state) => const ForgotPassScreen(),
  ),
];
