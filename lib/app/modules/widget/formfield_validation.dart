import 'package:login_demo/app/constants/language_constant.dart';

class Validation {
  static final Validation _instance = Validation._internal();

  factory Validation() {
    return _instance;
  }

  Validation._internal();

  String? validation(String value) {
    if (value.isEmpty) {
      return LanguageConst.emailValidationText;
    }
    return null;
  }

  String? passValidation(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password.isEmpty) {
      return LanguageConst.passwordValidation;
    }
    else if (!regExp.hasMatch(password)) {
      return LanguageConst.passwordValidationText;
    }
    return null;
  }
}
