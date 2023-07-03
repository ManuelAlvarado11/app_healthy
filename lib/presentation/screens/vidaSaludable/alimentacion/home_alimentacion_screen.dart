import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class HomeAlimentacionScreen extends StatelessWidget {
  static const routeName = 'home-alimentacion-screen';

  const HomeAlimentacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 6,
                color: AlimentacionColors.primary,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: AlimentacionColors.secondary,
                        onPressed: () => context.pop(),
                      ),

                      // PROFILE APP BAR
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 45),
                        child: ProfileAppBar(
                          isHome: true,
                          colorLineaHorizontal: AlimentacionColors.primary,
                          colorProfilePicture: AlimentacionColors.secondary,
                          iconButtonRight: "assets/svg/sis.svg",
                          iconProfile: const Icon(MdiIcons.cogSync),
                          onPressedIconButtonRight: () => {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Material(
                    elevation: 3,
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OptionMenuWidget(
                                icon: const Icon(
                                  MdiIcons.chartLine,
                                  color: AlimentacionColors.secondary,
                                  size: 28,
                                ),
                                title: 'Mi progreso',
                                onTap: () => {
                                  context.goNamed(
                                    MiProgresoAlimentacionScreen.routeName,
                                    pathParameters: {'page': '2'},
                                  ),
                                },
                              ),
                              OptionMenuWidget(
                                icon: const Icon(
                                  MdiIcons.heart,
                                  color: AlimentacionColors.secondary,
                                  size: 28,
                                ),
                                title: 'Mis favoritos',
                                onTap: () => {},
                              ),
                              OptionMenuWidget(
                                icon: const Icon(
                                  MdiIcons.cupWater,
                                  color: AlimentacionColors.secondary,
                                  size: 28,
                                ),
                                title: 'Agua',
                                onTap: () => {},
                              ),
                              OptionMenuWidget(
                                icon: const Icon(
                                  MdiIcons.lightbulbOn90,
                                  color: AlimentacionColors.secondary,
                                  size: 28,
                                ),
                                title: 'Contenido',
                                onTap: () => {},
                              ),
                              OptionMenuWidget(
                                icon: const Icon(
                                  MdiIcons.chefHat,
                                  color: AlimentacionColors.secondary,
                                  size: 28,
                                ),
                                title: 'Recetas saludables',
                                onTap: () => {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Recomendaciones',
                                style: TextStyle(
                                    color: AppColors.greyDark,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Material(
              elevation: 2,
              color: AppColors.white,
              borderRadius: BorderRadius.circular(50),
              child: CupertinoSearchTextField(
                prefixIcon: const Icon(MdiIcons.magnify),
                borderRadius: BorderRadius.circular(50),
                onChanged: (value) => {},
              ),
            ),
          ),
          _RecomendacionesList(),
        ],
      ),
    );
  }
}

class _RecomendacionesList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PROVIDER
    final recomendaciones = ref.watch(alimentacionProvider);

    return Flexible(
      child: recomendaciones.recomendaciones.isEmpty
          ? const Center(
              child: ResultEmptyWidget(
                mensajeVacio: 'No hay contenido de categoria',
                urlImagen: "assets/svg/vacio_alimentacion.svg",
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {},
              color: AlimentacionColors.secondary,
              backgroundColor: Colors.white,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  ...recomendaciones.recomendaciones
                      .toList()
                      .map((recomendacion) {
                    return CustomCardContentWidget(
                      contenido: recomendacion,
                      tipo: 2,
                    );
                  }).toList(),
                ],
              ),
            ),
    );
  }
}
