import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

final splashRouter = [
  // SPLASH CHECK AUTH
  GoRoute(
    path: SplashCheckAuthScreen.routeName,
    name: SplashCheckAuthScreen.routeName,
    builder: (context, state) => const SplashCheckAuthScreen(),
  ),

  // SPLASH VIDA SALUDABLE
  GoRoute(
    path: SplashVidaSaludableScreen.routeName,
    name: SplashVidaSaludableScreen.routeName,
    builder: (context, state) => const SplashVidaSaludableScreen(),
  ),
];
