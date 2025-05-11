import 'package:formz/formz.dart';

enum NameValidationError { invalid, empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty(String value) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    }

    if (value.length < 2) {
      return NameValidationError.invalid;
    }

    return null;
  }
}