import 'package:flutter/material.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class HomeAlimentacionScreen extends StatelessWidget {
  static const routeName = 'home-alimentacion-screen';

  const HomeAlimentacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alimentacion')),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
    );
  }
}
