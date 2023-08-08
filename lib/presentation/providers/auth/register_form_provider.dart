import 'package:app_vida_saludable/presentation/providers/providers.dart';
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/utils/inputs/inputs.dart';

class RegisterFormState {
  final bool isPosting;
  final bool isPosted;
  final bool isValid;

  final Text nombre;
  final Text apellido;
  final Dui documento;
  final Email email;
  final Text telefono;
  final Password password;
  final Numeric municipio;
  final Numeric departamento;

  RegisterFormState({
    this.isPosting = false,
    this.isPosted = false,
    this.isValid = false,
    this.nombre = const Text.pure(),
    this.apellido = const Text.pure(),
    this.documento = const Dui.pure(),
    this.email = const Email.pure(),
    this.telefono = const Text.pure(),
    this.password = const Password.pure(),
    this.municipio = const Numeric.pure(),
    this.departamento = const Numeric.pure(),
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isPosted,
    bool? isValid,
    Text? nombre,
    Text? apellido,
    Dui? documento,
    Email? email,
    Text? telefono,
    Password? password,
    Numeric? municipio,
    Numeric? departamento,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isPosted: isPosted ?? this.isPosted,
        isValid: isValid ?? this.isValid,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        documento: documento ?? this.documento,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        password: password ?? this.password,
        municipio: municipio ?? this.municipio,
        departamento: departamento ?? this.departamento,
      );
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String) registerCallback;

  RegisterFormNotifier({required this.registerCallback})
      : super(RegisterFormState());

  onNombreChange(String value) {
    final newNombre = Text.dirty(value);
    state = state.copyWith(
      nombre: newNombre,
      isValid: Formz.validate([newNombre]),
    );
  }

  onApellidoChange(String value) {
    final newApellido = Text.dirty(value);
    state = state.copyWith(
      apellido: newApellido,
      isValid: Formz.validate([newApellido]),
    );
  }

  onDocumentoChange(String value) {
    final newDocumento = Dui.dirty(value);
    state = state.copyWith(
      documento: newDocumento,
      isValid: Formz.validate([newDocumento]),
    );
  }

  onFormSubmit() async {
    __touchEveryField();
    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await registerCallback(state.nombre.value, state.apellido.value);

    state = state.copyWith(isPosting: false);
  }

  __touchEveryField() {
    final nombre = Text.dirty(state.nombre.value);
    final apellido = Text.dirty(state.apellido.value);
    final documento = Dui.dirty(state.documento.value);

    state = state.copyWith(
      isPosted: true,
      nombre: nombre,
      apellido: apellido,
      documento: documento,
      isValid: Formz.validate([nombre, apellido, documento]),
    );
  }
}

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerCallback = ref.watch(authProvider.notifier).registerUser;
  return RegisterFormNotifier(registerCallback: registerCallback);
});
