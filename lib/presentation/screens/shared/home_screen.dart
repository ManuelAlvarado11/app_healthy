import 'package:flutter/material.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final int pageIndex;

  HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = <Widget>[
    Scaffold(appBar: AppBar(title: const Text('Page 1'))),
    Scaffold(appBar: AppBar(title: const Text('Pege 2'))),
    Scaffold(appBar: AppBar(title: const Text('Page 3'))),
    Scaffold(appBar: AppBar(title: const Text('Page 4'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
