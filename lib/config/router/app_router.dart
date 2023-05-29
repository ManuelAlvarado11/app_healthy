import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/router/app_router_notifir.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';

final goRouterProvider = Provider((ref) {
  // PROVIDER STATE AUTH
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash-check-auth',
    refreshListenable: goRouterNotifier,
    routes: [
      // SPLASH CHECK AUTH
      GoRoute(
        path: '/splash-check-auth',
        name: SplashCheckAuthScreen.name,
        builder: (context, state) => const SplashCheckAuthScreen(),
      ),

      // LOGIN
      GoRoute(
        path: '/login',
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),

      // REGISTER
      GoRoute(
        path: '/register',
        name: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen(),
      ),

      // PAGES BOTTOM NAVIGATION
      GoRoute(
        path: '/page/:page',
        name: PagesScreen.name,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
          return PagesScreen(pageIndex: pageIndex);
        },
        routes: [],
      ),

      // REDIRECT
      GoRoute(path: '/', redirect: (_, __) => '/login')
    ],

    // PROTECCION DE RUTAS EN EL REDIRECT
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      // SPLASH CHECKING AUTH STATUS
      if (isGoingTo == '/splash-check-auth' &&
          authStatus == AuthStatus.checking) return null;

      // SPLASH CHECKED AUTH STATUS
      if (isGoingTo == '/splash-check-auth' &&
          authStatus == AuthStatus.notAuthenticaded) {
        return Future.delayed(const Duration(seconds: 2)).then((_) => '/login');
      }

      // NO AUTHENTICATED
      if (authStatus == AuthStatus.notAuthenticaded) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      // AUTHENTICADED
      if (authStatus == AuthStatus.authenticaded) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash-check-auth') return '/page/0';
      }
      return null;
    },
  );
});
