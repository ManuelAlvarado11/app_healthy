import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: SizedBox(
              width: size.width,
              child: Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: 500,
                          child: Image.asset(
                            "assets/img/sis_logo_horizontal.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                      SizedBox(
                        height: size.height - 260,
                        width: double.infinity,
                        child: const _LoginForm(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          // DUI
          CustomTextFormField(
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: false),
            icon: const Icon(Icons.person, color: AppColors.grey),
            label: 'DUI',
            onChanged: (value) {
              String dui = value.replaceAll("-", "");
              return dui;
            },
          ),
          const SizedBox(height: 30),

          // PASSWORD
          const CustomTextFormField(
            icon: Icon(Icons.lock, color: AppColors.grey),
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 10),

          // OLVIDO CONTRASEÑA
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/olvidaste'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),

          // BUTTON
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomTextButton(
              text: 'Ingresar',
              buttonColor: AppColors.primary,
              onPressed: () {},
            ),
          ),

          // REGISTRATE
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                onPressed: () => context.push('/register'),
                child: const Text(
                  'Registrate aquí',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
