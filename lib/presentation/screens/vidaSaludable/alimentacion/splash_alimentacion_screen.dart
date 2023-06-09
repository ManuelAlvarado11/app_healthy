import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';

class SplashAlimentacionScreen extends StatefulWidget {
  static const routeName = '/splash-alimentacion-screen';

  const SplashAlimentacionScreen({super.key});

  @override
  State<SplashAlimentacionScreen> createState() =>
      _SplashAlimentacionScreenState();
}

class _SplashAlimentacionScreenState extends State<SplashAlimentacionScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(
        HomeAlimentacionScreen.routeName,
        pathParameters: {'page': '2'},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        "assets/img/splash_alimentacion.png",
        width: size.width,
        height: size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
