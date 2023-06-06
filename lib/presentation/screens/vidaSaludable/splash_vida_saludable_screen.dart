import 'package:app_vida_saludable/presentation/screens/shared/pages_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashVidaSaludableScreen extends StatefulWidget {
  static const routeName = '/splash-vida-saludable-screen';

  const SplashVidaSaludableScreen({super.key});

  @override
  State<SplashVidaSaludableScreen> createState() =>
      _SplashVidaSaludableScreenState();
}

class _SplashVidaSaludableScreenState extends State<SplashVidaSaludableScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      context.go('${PagesScreen.routeName}/2');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Image.asset(
      "assets/img/splash_vida_saludable.png",
      width: size.width,
      height: size.height,
      fit: BoxFit.cover,
    );
  }
}
