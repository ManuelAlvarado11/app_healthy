import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class ExpedienteInfoWidget extends StatelessWidget {
  const ExpedienteInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // GENERAL
              CustomTextButton(
                text: 'General',
                buttonColor: AppColors.primary,
                onPressed: () => {},
              ),

              // GENERAL
              CustomTextButton(
                text: 'Antecedentes',
                buttonColor: AppColors.primary,
                onPressed: () => {},
              ),

              // GENERAL
              CustomTextButton(
                text: 'Historial Medico',
                buttonColor: AppColors.primary,
                onPressed: () => {},
              ),

              // GENERAL
              CustomTextButton(
                text: 'Recetas medicas',
                buttonColor: AppColors.primary,
                onPressed: () => {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
          color: AppColors.greyDark200,
          width: MediaQuery.of(context).size.height,
          height: 1.0,
        ),
        const SizedBox(height: 20),

        // TODO: Lista de widgets
      ],
    );
  }
}
