import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class PagesScreen extends StatelessWidget {
  static const routeName = '/pages-screen';

  final int pageIndex;

  PagesScreen({super.key, required this.pageIndex});

  final pagesRoutes = <Widget>[
    const HomeScreen(),
    const ExpedienteScreen(isSincronizacion: false),
    const HomeScreen(),
    const ConfigurationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pagesRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
