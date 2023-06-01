// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 6,
              color: AppColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // PROFILE APP BAR
                  const SizedBox(height: 20.0),
                  const ProfileAppBar(
                    isHome: true,
                  ),

                  // SECCION 1 (EMOCIONES)
                  const SizedBox(height: 20.0),
                  const Text(
                    '¿Cómo te sientes hoy?',
                    style: TextStyle(
                      fontFamily: 'MuseoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22.0,
                      color: AppColors.greyDark,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeelingButtonWidget(
                        idEmocion: 1,
                        isSelected: true,
                        onTap: () {},
                      ),
                      FeelingButtonWidget(
                        idEmocion: 2,
                        isSelected: false,
                        onTap: () {},
                      ),
                      FeelingButtonWidget(
                        idEmocion: 3,
                        isSelected: false,
                        onTap: () {},
                      ),
                      FeelingButtonWidget(
                        idEmocion: 4,
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Visibility(
                    visible: true,
                    child: Column(
                      children: [
                        MaterialButton(
                            elevation: 3,
                            color: AppColors.radioButtonIconSelected,
                            textColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('Registrar emocion'),
                            onPressed: () {}),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Ver resumen de emociones',
                          style: TextStyle(
                            fontFamily: 'MuseoSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.radioButtonIconSelected,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SECCION 2 (GRAFICO DE PESOS)
                  const SizedBox(height: 20.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Grafico de historial de pesos',
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontSize: 12,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          isVisible: false,
                        ),
                        primaryYAxis: NumericAxis(
                          labelFormat: "{value} Kg",
                        ),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          header: 'Informacion',
                          format: 'Fecha: point.x\nPeso: point.y',
                        ),
                        series: [
                          SplineSeries<String, String>(
                            color: AppColors.primary,
                            dataSource: const [],
                            markerSettings: const MarkerSettings(
                                isVisible: true,
                                borderColor: AppColors.primary,
                                color: AppColors.primary),
                            xValueMapper: (datum, index) => '',
                            yValueMapper: (datum, index) => 1,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => {},
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Agregar registro',
                        style: TextStyle(
                          fontFamily: 'MuseoSans',
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  // SECCION 3 (CARDS)
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NotificationWidget(
                        title: 'Beber Agua',
                        subtitle: 'Programar recordatorio',
                        icon: SvgPicture.asset(
                          "assets/svg/agua.svg",
                          color: Colors.white,
                          height: 50.0,
                        ),
                        color: AppColors.sky,
                      ),
                      NotificationWidget(
                        title: 'Horas de sueño',
                        subtitle: "Registrar horas de sueño",
                        icon: SvgPicture.asset(
                          "assets/svg/horas-suenio.svg",
                          color: Colors.white,
                          height: 50.0,
                        ),
                        color: AppColors.sky,
                      ),
                      NotificationWidget(
                        title: 'Actividad física',
                        subtitle: "Registrar actividad",
                        icon: Transform.rotate(
                          angle: 0.5,
                          child: SvgPicture.asset(
                            "assets/svg/ejercicio_home.svg",
                            color: Colors.white,
                            height: 35.0,
                          ),
                        ),
                        color: AppColors.sky,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
