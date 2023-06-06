import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class ForgotPassScreen extends StatelessWidget {
  static const routeName = '/forgot-pass-screen';

  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.canPop() ? context.pop() : null,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 100,
            child: Image.asset(
              "assets/img/sis_logo_horizontal.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TITLE
                  const Center(
                    child: Text(
                      'Restablecer Contraseña',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70.0),

                  // SUBTITLE
                  const Center(
                    child: Text(
                      '¡No te preocupes!',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // MESSAGE
                  Container(
                    width: 500,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Text(
                      'Te enviaremos un link de acceso a tu correo electrónico o a tu número de teléfono para que puedas establecer una nueva contraseña',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: AppColors.greyDark),
                    ),
                  ),

                  // IMAGE
                  Center(
                      heightFactor: 0.8,
                      child: Image.asset("assets/img/forgot_password_email.png",
                          height: 250)),
                  const SizedBox(height: 20.0),

                  // EMAIL
                  CustomTextFormField(
                    label: 'CORREO ELECTRONICO',
                    icon: const Icon(Icons.lock, color: AppColors.grey),
                    keyboardType: TextInputType.emailAddress,
                    backgroundColor: AppColors.greyLight,
                    labelColor: AppColors.grey,
                    errorMessage: null,
                    onChanged: (value) {
                      null;
                    },
                    listTextInputFormatter: [
                      LengthLimitingTextInputFormatter(256),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // BUTTON
                  const CustomTextButton(
                    text: 'Enviar',
                    buttonColor: AppColors.primary,
                    onPressed: null,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
