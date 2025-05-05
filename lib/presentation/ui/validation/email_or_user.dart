import 'package:formz/formz.dart';

enum EmailOrUserValidationError {
  empty('VALIDATION.REQUIRED');

  const EmailOrUserValidationError(this.message);

  final String message;
}

class EmailOrUser extends FormzInput<String, EmailOrUserValidationError> {
  const EmailOrUser.pure() : super.pure('');

  const EmailOrUser.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailOrUserValidationError? validator(String? value) {
    return value?.isEmpty == true ? EmailOrUserValidationError.empty : null;
  }
}