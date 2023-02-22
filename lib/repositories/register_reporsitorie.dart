import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:games_finish/models/user_model.dart';

class RegisterUser {
  RegisterUser._();
  static RegisterUser? _instance;

  static RegisterUser? get instance {
    _instance ??= RegisterUser._();
    return _instance;
  }

  String returnError(e) {
    return e;
  }

  Future<void> registerUser(User? user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'userFullName': user!.userFullName,
        'userEmail': user.userEmail,
        'userPhone': user.userPhone,
        'userPassword': user.userPassword,
      });
    } catch (e) {
      print(e);
      returnError(e);
    }
  }
}
