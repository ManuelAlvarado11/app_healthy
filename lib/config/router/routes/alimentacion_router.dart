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
      GoRoute(
        path: MiProgresoAlimentacionScreen.routeName,
        name: MiProgresoAlimentacionScreen.routeName,
        builder: (context, state) => const _CustomPage(
          title: 'Mi progreso',
          body: MiProgresoAlimentacionScreen(),
        ),
      )
    ],
  ),
];

// Widget usado para mantener el bottomNavigationBar del padre
class _CustomPage extends StatelessWidget {
  final String? title;
  final Widget body;

  const _CustomPage({
    required this.body,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? const CustomAppBar(
              title: 'Mi progreso',
              color: AlimentacionColors.primary,
            )
          : null,
      body: body,
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
