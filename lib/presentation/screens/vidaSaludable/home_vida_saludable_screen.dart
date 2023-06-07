import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      _MenuVidaSaludable(
                        title: 'Alimentacion',
                        img: "assets/img/alimentacion_home.png",
                        icon: "assets/svg/alimentacion_home.svg",
                        colorBanner: AppColors.greenDark,
                        onTap: () => {},
                      ),
                      _MenuVidaSaludable(
                        title: 'Salud bucal',
                        img: "assets/img/salud_bucal_home.png",
                        icon: "assets/svg/salud_bucal_home.svg",
                        colorBanner: AppColors.skyBlue,
                        onTap: () => {},
                      ),
                      _MenuVidaSaludable(
                        title: 'Ejercicio',
                        // title: S.of(context).proximamente,
                        img: "assets/img/ejercicio_home.png",
                        icon: "assets/svg/ejercicio_home.svg",
                        colorBanner: EjercicioColors.secondary,
                        onTap: () => {},
                      ),
                      _MenuVidaSaludable(
                        title: 'Proximamente',
                        img: "assets/img/salud_mental_home.png",
                        icon: "assets/svg/salud_mental_home.svg",
                        colorBanner: AppColors.skyBlueLight,
                        onTap: () {},
                      ),
                      _MenuVidaSaludable(
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

class _MenuVidaSaludable extends StatelessWidget {
  final String title;
  final String icon;
  final String img;
  final Color colorBanner;
  final GestureTapCallback? onTap;

  const _MenuVidaSaludable({
    required this.title,
    required this.icon,
    required this.img,
    required this.colorBanner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 30.0, right: 30.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 125,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.cover,
                  width: size.width,
                ),
                Container(
                  width: size.width,
                  color: colorBanner.withOpacity(0.70),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        icon,
                        height: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'MuseoSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
