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
      title: null,
      body: HomeAlimentacionScreen(),
    ),
    routes: [
      // MI PROGRESO
      GoRoute(
        path: MiProgresoAlimentacionScreen.routeName,
        name: MiProgresoAlimentacionScreen.routeName,
        builder: (context, state) => const _CustomPage(
          title: 'Contenidos',
          body: MiProgresoAlimentacionScreen(),
        ),
      ),

      // CONTENIDOS
      GoRoute(
        path: ContenidoAlimentacionScreen.routeName,
        name: ContenidoAlimentacionScreen.routeName,
        builder: (context, state) => const _CustomPage(
          title: 'Contenidos',
          body: ContenidoAlimentacionScreen(),
        ),
      )
    ],
  ),
];

// PAGE PARA REUTILIZAR BOTTOM NAVIGATION BAR DEL PADRE
class _CustomPage extends StatelessWidget {
  final String? title;
  final Widget body;

  const _CustomPage({
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? CustomAppBar(
              title: title,
              color: AlimentacionColors.primary,
            )
          : null,
      body: body,
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
