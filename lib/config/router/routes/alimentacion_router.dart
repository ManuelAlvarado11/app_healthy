import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

final alimentacionRouter = [
  // HOME
  GoRoute(
    path: HomeAlimentacionScreen.routeName,
    name: HomeAlimentacionScreen.routeName,
    builder: (context, state) => const _CustomPage(
      body: HomeAlimentacionScreen(),
    ),
    routes: [
      // MI PROGRESO
      GoRoute(
        path: MiProgresoAlimentacionScreen.routeName,
        name: MiProgresoAlimentacionScreen.routeName,
        builder: (context, state) => const _CustomPage(
          appBar: CustomAppBar(
            title: 'Mi progreso',
            color: AlimentacionColors.primary,
          ),
          body: MiProgresoAlimentacionScreen(),
        ),
      ),

      // CONTENIDOS
      GoRoute(
        path: ContenidoAlimentacionScreen.routeName,
        name: ContenidoAlimentacionScreen.routeName,
        builder: (context, state) => const _CustomPage(
          appBar: CustomAppBar(
            title: 'Contenidos',
            color: AlimentacionColors.primary,
          ),
          body: ContenidoAlimentacionScreen(),
        ),
      )
    ],
  ),
];

// WIDGET ----> REUTILIZAR BOTTOM NAVIGATION BAR DEL PADRE
class _CustomPage extends StatelessWidget {
  final CustomAppBar? appBar;
  final Widget body;

  const _CustomPage({
    this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
