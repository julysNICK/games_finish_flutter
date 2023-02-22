import 'package:games_finish/models/user_model.dart';
import 'package:games_finish/utils/verify_fields.dart';

class ThrowMessage {
  static String throwMessage(String message) {
    return message;
  }
}

class ThrowMessageFieldsUsers {
  User user;

  ThrowMessageFieldsUsers({
    required this.user,
  });

  String throwMessageEmpty() {
    if (user.userFullName.isEmpty) {
      print("entrei aquidwqdqw");
      return ThrowMessage.throwMessage("Full Name is empty");
    } else if (user.userEmail.isEmpty) {
      return ThrowMessage.throwMessage("Email is empty");
    } else if (user.userPassword.isEmpty) {
      return ThrowMessage.throwMessage("Password is empty");
    } else if (user.userPhone.isEmpty) {
      return ThrowMessage.throwMessage("Number Phone is empty");
    }
    return "";
  }

  String throwMessageVerifyFields() {
    if (!VerifyFields.isEmailValid(user.userEmail)) {
      return ThrowMessage.throwMessage("Email is invalid");
    } else if (!VerifyFields.isPasswordValid(user.userPassword)) {
      return ThrowMessage.throwMessage("Password is invalid");
    } else if (!VerifyFields.isPhoneValid(user.userPhone)) {
      return ThrowMessage.throwMessage("Number Phone is invalid");
    }
    return "";
  }
}
