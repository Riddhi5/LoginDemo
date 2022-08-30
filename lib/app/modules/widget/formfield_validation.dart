class Validation {
  static final Validation _instance = Validation._internal();

  factory Validation() {
    return _instance;
  }

  Validation._internal();

  String? validation(String value) {
    if (value.isEmpty) {
      return 'Please enter email/MobileNumber';
    }
    return null;
  }

  String? passValidation(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password.isEmpty) {
      return 'Please enter mobile password';
    }
    else if (!regExp.hasMatch(password)) {
      return 'Minimum eight characters, at least one letter, one number and one special character are required';
    }
    return null;
  }
}
