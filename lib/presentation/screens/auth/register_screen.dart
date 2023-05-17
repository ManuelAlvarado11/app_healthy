import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            toolbarHeight: 100,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
              onPressed: () => context.pop(),
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
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // SALUDO
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          '¡Hola! Vamos a registrarte',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.greyDark),
                        ),
                      ),

                      // FORM
                      SizedBox(height: 20),
                      _RegisterForm()
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          // NOMBRES
          const CustomTextFormField(
            label: 'Nombres*',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          // APELLIDOS
          const CustomTextFormField(
            label: 'Apellidos*',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          // DUI
          CustomTextFormField(
            label: 'Numero DUI*',
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: false),
            onChanged: (value) {
              String dui = value.replaceAll("-", "");
              return dui;
            },
          ),
          const SizedBox(height: 30),

          // DEPARTAMENTO
          const CustomContainerSelected(
            txtSelected: 'Departamento',
          ),
          const SizedBox(height: 30),

          // MUNICIPIO
          const CustomContainerSelected(
            txtSelected: 'Municipio',
          ),
          const SizedBox(height: 30),

          // TELEFONO
          CustomTextFormField(
            label: 'Numero de teléfono*',
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: false),
            onChanged: (value) {
              String dui = value.replaceAll("-", "");
              return dui;
            },
          ),
          const SizedBox(height: 30),

          // CORREO
          const CustomTextFormField(
            label: 'Correo*',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),

          // PASSWORD
          const CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 30),
          const CustomTextFormField(
            label: 'Repita la contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 30),

          // BUTTON
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomTextButton(
              text: 'Registrarme',
              buttonColor: AppColors.primary,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
