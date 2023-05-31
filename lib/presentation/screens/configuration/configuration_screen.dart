import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfigurationScreen extends ConsumerWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 70.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child:
                        Center(child: Image.asset("assets/img/logo_blue.png")),
                  ),
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text(
                      'Configuración',
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/salir_icon.png',
                        height: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        child: const Text(
                          'Cerrar sesion',
                          style:
                              TextStyle(fontSize: 14, color: AppColors.primary),
                        ),
                        onPressed: () => showDialogCerrarSesion(context, ref),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showDialogCerrarSesion(BuildContext context, WidgetRef ref) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: AppColors.greyLight90,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    "assets/icon/salir_app_icon.png",
                    height: 58,
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Desea salir de la cuenta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text(
                          'Regresar',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: AppColors.primary),
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      const SizedBox(width: 20),
                      CustomButton(
                        txtButton: 'Salir',
                        colorButton: AppColors.primary,
                        colorTxt: AppColors.white,
                        fontsize: 16,
                        onPressed: () {
                          ref.read(authProvider.notifier).logout();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
