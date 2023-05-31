import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:app_vida_saludable/config/helpers/mask_formats.dart'
    as mask_formats;

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
              child: const Center(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: _LoginForm(),
                ),
              ),
            ),
          )),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PROVIDER
    final loginForm = ref.watch(loginFormProvider);

    // SHOW MESSAGE ERROR
    ref.listen(
      authProvider,
      (previous, next) {
        if (next.errorMessage.isEmpty) return;
        showSnackbar(context, next.errorMessage, Colors.red);
      },
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // LOGO
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 50,
          ),
          child: SizedBox(
            width: 500,
            child: Image.asset(
              "assets/img/sis_logo_horizontal.png",
              fit: BoxFit.contain,
            ),
          ),
        ),

        // DUI
        CustomTextFormField(
          label: 'DUI',
          icon: const Icon(Icons.person, color: AppColors.grey),
          backgroundColor: AppColors.greyLight,
          labelColor: AppColors.grey,
          errorMessage: loginForm.isPosted ? loginForm.dui.errorMessage : null,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: false,
          ),
          onChanged: (value) {
            String dui = value.replaceAll("-", "");
            ref.read(loginFormProvider.notifier).onDuiChange(dui);
          },
          listTextInputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9),
            mask_formats.maskFormatterDUI,
          ],
        ),

        // PASSWORD
        CustomTextFormField(
          label: 'Contraseña',
          icon: const Icon(Icons.lock, color: AppColors.grey),
          backgroundColor: AppColors.greyLight,
          labelColor: AppColors.grey,
          errorMessage:
              loginForm.isPosted ? loginForm.password.errorMessage : null,
          obscureText: true,
          onChanged: (value) {
            ref.read(loginFormProvider.notifier).onPasswordChange(value);
          },
        ),
        const SizedBox(height: 10),

        // OLVIDO CONTRASEÑA
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
        CustomTextButton(
          text: 'Ingresar',
          buttonColor: AppColors.primary,
          onPressed: loginForm.isPosting
              ? null
              : ref.read(loginFormProvider.notifier).onFormSubmit,
        ),
        const SizedBox(height: 40),

        // REGISTRATE
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
      ],
    );
  }
}
