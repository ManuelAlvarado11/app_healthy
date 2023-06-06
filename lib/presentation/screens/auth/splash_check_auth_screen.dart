import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class SplashCheckAuthScreen extends StatefulWidget {
  static const routeName = '/splash-check-auth-screen';

  const SplashCheckAuthScreen({super.key});

  @override
  State<SplashCheckAuthScreen> createState() => _SplashCheckAuthScreenState();
}

class _SplashCheckAuthScreenState extends State<SplashCheckAuthScreen>
    with TickerProviderStateMixin {
  // ANIMATION SPLASH
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  // END ANIMATION

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: AppColors.primary,
          ),
          FadeTransition(
            opacity: _animation,
            child: Center(
              child: Image.asset("assets/img/logo_white.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'V. 1.0.1+1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'MuseoSans',
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
