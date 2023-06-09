import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class MiProgresoAlimentacionScreen extends StatelessWidget {
  static const routeName = 'mi-progreso-alimentacion-screen';

  const MiProgresoAlimentacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Grafico historial de pesos',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.greyDark,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    txtButton: 'Registrar peso',
                    colorButton: AlimentacionColors.primary,
                    colorTxt: AppColors.greyDark,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 400,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      isVisible: false,
                    ),
                    primaryYAxis: NumericAxis(
                      maximum: 1,
                      minimum: 0,
                      interval: 10,
                      labelFormat: "{value} Kg",
                    ),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: 'Informacion',
                      format: 'Fecha: point.x\nPeso: point.y',
                    ),
                    series: <SplineAreaSeries<String, String>>[
                      SplineAreaSeries<String, String>(
                        color: AppColors.skyLight,
                        borderColor: AppColors.primary,
                        borderWidth: 2,
                        dataSource: const [],
                        markerSettings: const MarkerSettings(
                            isVisible: true,
                            borderColor: AppColors.primary,
                            color: AppColors.primary),
                        xValueMapper: (datum, index) => '',
                        yValueMapper: (datum, index_) => 1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonMiProgresoWidget(
                icon: const Icon(
                  MdiIcons.speedometerMedium,
                  color: AlimentacionColors.secondary,
                  size: 28,
                ),
                txtButton: 'Peso del 01/01/2023 : 177.00 Lbs',
                onPressed: () => {},
              ),
              ButtonMiProgresoWidget(
                icon: const Icon(
                  MdiIcons.calculatorVariant,
                  color: AlimentacionColors.secondary,
                  size: 28,
                ),
                txtButton: 'Calculadora IMC',
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
