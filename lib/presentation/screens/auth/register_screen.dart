import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_vida_saludable/config/theme/app_colors.dart';
import 'package:app_vida_saludable/presentation/widgets/widgets.dart';
import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:app_vida_saludable/config/helpers/mask_formats.dart'
    as mask_formats;

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            elevation: 0,
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
              child: const Center(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // PROVIDER
    final registerForm = ref.watch(registerFormProvider);

    final shared = ref.watch(sharedProvider);
    final departamentos = shared.departamentos;
    final municipios = shared.municipios;

    return Column(
      children: [
        // NOMBRES
        CustomTextFormField(
          label: 'Nombres*',
          errorMessage:
              registerForm.isPosted ? registerForm.nombre.errorMessage : null,
          onChanged: (value) {
            ref.read(registerFormProvider.notifier).onNombreChange(value);
          },
        ),
        const SizedBox(height: 10),

        // APELLIDOS
        CustomTextFormField(
          label: 'Apellidos*',
          errorMessage:
              registerForm.isPosted ? registerForm.apellido.errorMessage : null,
          onChanged: (value) {
            ref.read(registerFormProvider.notifier).onApellidoChange(value);
          },
        ),
        const SizedBox(height: 10),

        // DUI
        CustomTextFormField(
          label: 'Numero DUI*',
          keyboardType: const TextInputType.numberWithOptions(
              decimal: false, signed: false),
          errorMessage: registerForm.isPosted
              ? registerForm.documento.errorMessage
              : null,
          onChanged: (value) {
            String dui = value.replaceAll("-", "");
            ref.read(registerFormProvider.notifier).onDocumentoChange(dui);
          },
          listTextInputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(9),
            mask_formats.maskFormatterDUI,
          ],
        ),
        const SizedBox(height: 10),

        // DEPARTAMENTO
        CustomSelectFormField(
          label: 'Departamento',
          items: departamentos,
          onChanged: (value) {
            ref.read(sharedProvider.notifier).getMunicipios(value.id);
          },
        ),
        const SizedBox(height: 10),

        // MUNICIPIO
        CustomSelectFormField(
          label: 'Municipio',
          items: municipios,
          onChanged: (value) => {},
        ),
        const SizedBox(height: 10),

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
        const SizedBox(height: 10),

        // CORREO
        const CustomTextFormField(
          label: 'Correo*',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),

        // PASSWORD
        const CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
        ),
        const SizedBox(height: 10),
        const CustomTextFormField(
          label: 'Repita la contraseña',
          obscureText: true,
        ),
        const SizedBox(height: 10),

        // BUTTON
        CustomTextButton(
          text: 'Registrarme',
          buttonColor: AppColors.primary,
          onPressed: registerForm.isPosting
              ? null
              : ref.read(registerFormProvider.notifier).onFormSubmit,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
