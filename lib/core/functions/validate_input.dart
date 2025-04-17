import 'package:meals_recommendation/core/utils/app_strings.dart';

class ValidateInput {
  ValidateInput._();
  static String? validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return AppString.emptyField;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppString.emptyField;
    } else if (!email.contains("@")) {
      return AppString.notValid;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppString.emptyField;
    } else if (password.length < 8) {
      return AppString.passwordTooShort;
    }
    return null;
  }
}
