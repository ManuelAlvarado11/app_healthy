import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/router/app_router_notifir.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

final goRouterProvider = Provider((ref) {
  // PROVIDER STATE AUTH
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: SplashCheckAuthScreen.routeName,
    refreshListenable: goRouterNotifier,
    routes: [
      // SPLASH CHECK AUTH
      GoRoute(
        path: SplashCheckAuthScreen.routeName,
        name: SplashCheckAuthScreen.routeName,
        builder: (context, state) => const SplashCheckAuthScreen(),
      ),

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

      // PAGES BOTTOM NAVIGATION
      GoRoute(
        path: '${PagesScreen.routeName}/:page',
        name: PagesScreen.routeName,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
          return PagesScreen(pageIndex: pageIndex);
        },
      ),
      // SPLASH VIDA SALUDABLE
      GoRoute(
        path: SplashVidaSaludableScreen.routeName,
        name: SplashVidaSaludableScreen.routeName,
        builder: (context, state) => const SplashVidaSaludableScreen(),
      ),

      // REDIRECT
      GoRoute(path: '/', redirect: (_, __) => LoginScreen.routeName)
    ],

    // PROTECCION DE RUTAS EN EL REDIRECT
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      // SPLASH CHECKING AUTH STATUS
      if (isGoingTo == SplashCheckAuthScreen.routeName &&
          authStatus == AuthStatus.checking) return null;

      // SPLASH CHECKED AUTH STATUS
      if (isGoingTo == SplashCheckAuthScreen.routeName &&
          authStatus == AuthStatus.notAuthenticaded) {
        return Future.delayed(const Duration(seconds: 2))
            .then((_) => LoginScreen.routeName);
      }

      // NO AUTHENTICATED
      if (authStatus == AuthStatus.notAuthenticaded) {
        if (isGoingTo == LoginScreen.routeName ||
            isGoingTo == RegisterScreen.routeName ||
            isGoingTo == ForgotPassScreen.routeName) return null;

        return LoginScreen.routeName;
      }

      // AUTHENTICADED
      if (authStatus == AuthStatus.authenticaded) {
        if (isGoingTo == SplashCheckAuthScreen.routeName ||
            isGoingTo == LoginScreen.routeName ||
            isGoingTo == RegisterScreen.routeName ||
            isGoingTo == ForgotPassScreen.routeName) {
          return '${PagesScreen.routeName}/0';
        }
      }
      return null;
    },
  );
});
