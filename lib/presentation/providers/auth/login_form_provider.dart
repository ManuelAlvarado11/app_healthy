import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_vida_saludable/config/utils/inputs/inputs.dart';

// State
class LoginFormState {
  final bool isPosting;
  final bool isPosted;
  final bool isValid;
  final Dui dui;
  final Password password;

  LoginFormState({
    this.isPosting = false,
    this.isPosted = false,
    this.isValid = false,
    this.dui = const Dui.pure(),
    this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isPosted,
    bool? isValid,
    Dui? dui,
    Password? password,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isPosted: isPosted ?? this.isPosted,
        isValid: isValid ?? this.isValid,
        dui: dui ?? this.dui,
        password: password ?? this.password,
      );

  @override
  String toString() {
    return '''
      LoginFormState:
        isPosting: $isPosting
        isPosted: $isPosted
        isValid: $isValid
        dui: $dui
        password: $password
      ''';
  }
}

// Notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  onDuiChange(String value) {
    final newDui = Dui.dirty(value);
    state = state.copyWith(
      dui: newDui,
      isValid: Formz.validate([newDui, state.password]),
    );
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.dui, newPassword]),
    );
  }

  onFormSubmit() {
    __touchEveryField();
    if (!state.isValid) return;

    print(state);
  }

  __touchEveryField() {
    final dui = Dui.dirty(state.dui.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isPosted: true,
      dui: dui,
      password: password,
      isValid: Formz.validate([dui, password]),
    );
  }
}

// Provider
final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});
