import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    routes: [],
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
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: body,
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
