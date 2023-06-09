import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';

class HomeVidaSaludableScreen extends StatelessWidget {
  const HomeVidaSaludableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/svg/linea_azul.svg",
                width: size.width,
                colorFilter:
                    const ColorFilter.mode(AppColors.sky, BlendMode.srcIn),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  color: AppColors.primary,
                ),

                // PROFILE APP BAR
                const SizedBox(height: 20.0),
                const ProfileAppBar(
                  isHome: true,
                ),

                // PREGUNTA
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.0),
                      Text(
                        "Escoge una opcion",
                        style: TextStyle(
                          fontFamily: 'MuseoSans',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: AppColors.greyDark,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // MODULOS
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      MenuVidaSaludable(
                        title: 'Alimentacion',
                        img: "assets/img/alimentacion_home.png",
                        icon: "assets/svg/alimentacion_home.svg",
                        colorBanner: AppColors.greenDark,
                        onTap: () =>
                            context.go(SplashAlimentacionScreen.routeName),
                      ),
                      MenuVidaSaludable(
                        title: 'Salud bucal',
                        img: "assets/img/salud_bucal_home.png",
                        icon: "assets/svg/salud_bucal_home.svg",
                        colorBanner: AppColors.skyBlue,
                        onTap: () => {},
                      ),
                      MenuVidaSaludable(
                        title: 'Ejercicio',
                        // title: S.of(context).proximamente,
                        img: "assets/img/ejercicio_home.png",
                        icon: "assets/svg/ejercicio_home.svg",
                        colorBanner: EjercicioColors.secondary,
                        onTap: () => {},
                      ),
                      MenuVidaSaludable(
                        title: 'Proximamente',
                        img: "assets/img/salud_mental_home.png",
                        icon: "assets/svg/salud_mental_home.svg",
                        colorBanner: AppColors.skyBlueLight,
                        onTap: () {},
                      ),
                      MenuVidaSaludable(
                        title: 'Proximamente',
                        img: "assets/img/control_ciclo_home.png",
                        icon: "assets/svg/control_ciclo_home.svg",
                        colorBanner: AppColors.rosa,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
