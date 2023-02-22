class VerifyFields {
  static bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  static bool isNameValid(String name) {
    return name.length >= 3;
  }

  static bool isPhoneValid(String phone) {
    return phone.length >= 10;
  }

  static bool isEmailEmpty(String email) {
    return email.isEmpty;
  }

  static bool isPasswordEmpty(String password) {
    return password.isEmpty;
  }

  static bool isNameEmpty(String name) {
    return name.isEmpty;
  }

  static bool isPhoneEmpty(String phone) {
    return phone.isEmpty;
  }
}
