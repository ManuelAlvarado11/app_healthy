import 'package:formz/formz.dart';

enum DuiError { empty, length }

class Dui extends FormzInput<String, DuiError> {
  const Dui.pure() : super.pure('');
  const Dui.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == DuiError.empty) return 'El campo es requerido';
    if (displayError == DuiError.length) return 'El formato es incorrecto';

    return null;
  }

  @override
  DuiError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return DuiError.empty;
    if (value.length < 9) return DuiError.length;

    return null;
  }
}
