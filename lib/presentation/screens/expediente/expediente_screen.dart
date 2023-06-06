import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/screens/screens.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class ExpedienteScreen extends StatelessWidget {
  final bool isSincronizacion;

  const ExpedienteScreen({super.key, required this.isSincronizacion});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: isSincronizacion
            ? null
            : CustomAppBar(
                onPressed: () => context.go('${PagesScreen.routeName}/0'),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: isSincronizacion,
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        SvgPicture.asset(
                          "assets/svg/circulo.svg",
                          width: size.width,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Image.asset(
                              "assets/img/sis_logo_horizontal_blanco.png"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Expdiente de paciente SIS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'No se encontraron los siguintes datos',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const ProfileInfoWidget(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Dslice para mas opciones',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const ExpedienteInfoWidget(),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: isSincronizacion,
                      child: Center(
                        child: CustomTextButton(
                          text: 'Siguiente',
                          buttonColor: AppColors.primary,
                          onPressed: () => {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
