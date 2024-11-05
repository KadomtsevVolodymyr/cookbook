import 'package:email_validator/email_validator.dart';

class Validators {
  Validators._();

  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool isInvalidEmail(String? value) {
    return isEmpty(value) || !EmailValidator.validate(value!);
  }

  static bool isInvalidLength(String? value, {int? minLength, int? maxLength}) {
    assert(
      minLength != null || maxLength != null,
      'At least one of minLength or maxLength must be provided',
    );

    if (value == null) return true;
    if (minLength != null && value.length < minLength) return true;
    if (maxLength != null && value.length > maxLength) return true;

    return false;
  }

  static bool isInvalidPassword(String? value) {
    // Password should be at least 6 characters and should contain at least one letter and one number
    if (isEmpty(value)) return true;
    final hasUpperCase = value!.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = value.contains(RegExp(r'[a-z]'));
    final hasDigits = value.contains(RegExp(r'[0-9]'));
    return value.length < 6 || !hasUpperCase || !hasLowerCase || !hasDigits;
  }

  static bool isInvalidName(String? value) {
    return isEmpty(value) || value!.length < 3;
  }
}
