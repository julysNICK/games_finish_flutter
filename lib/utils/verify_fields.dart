class VerifyFields {
  static bool isEmailValid(String email) {
    return true;
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
}
