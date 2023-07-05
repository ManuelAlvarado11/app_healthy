import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_vida_saludable/config/router/app_redirect.dart';
import 'package:app_vida_saludable/config/router/app_router_notifier.dart';
import 'package:app_vida_saludable/config/router/routes/routes.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  // PROVIDER STATE AUTH
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: SplashCheckAuthScreen.routeName,
    refreshListenable: goRouterNotifier,
    routes: [
      // AUTH ROUTES
      ...authRouter,

      //SPLASH ROUTES
      ...splashRouter,

      // PAGES BOTTOM NAVIGATION
      GoRoute(
        path: '${PagesScreen.routeName}/:page',
        name: PagesScreen.routeName,
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
          return PagesScreen(pageIndex: pageIndex);
        },
        routes: [
          // ALIMENTACION ROUTES
          ...alimentacionRouter,
        ],
      ),

      // REDIRECT
      GoRoute(path: '/', redirect: (_, __) => LoginScreen.routeName)
    ],

    // PROTECCION DE RUTAS EN EL REDIRECT
    redirect: (context, state) {
      return redirectTo(
        state.matchedLocation,
        goRouterNotifier.authStatus,
      );
    },
  );
});
