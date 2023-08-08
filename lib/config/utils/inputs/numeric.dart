import 'package:formz/formz.dart';

// Define input validation errors
enum NumericError { empty, value, format }

// Extend FormzInput and provide the input type and error type.
class Numeric extends FormzInput<int, NumericError> {
  // Call super.pure to represent an unmodified form input.
  const Numeric.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const Numeric.dirty(int value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NumericError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == NumericError.value) {
      return 'Tiene que ser un número mayor o igual a cero';
    }
    if (displayError == NumericError.format) {
      return 'No tiene formato de número';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NumericError? validator(int value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return NumericError.empty;
    }

    final isInteger = int.tryParse(value.toString()) ?? -1;
    if (isInteger == -1) return NumericError.format;

    if (value < 0) return NumericError.value;

    return null;
  }
}
