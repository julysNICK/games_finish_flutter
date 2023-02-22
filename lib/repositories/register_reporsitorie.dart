import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:games_finish/models/user_model.dart';

class RegisterUser {
  User user;

  RegisterUser({required this.user});

  String returnError(e) {
    return e;
  }

  Future<void> registerUser() async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'userFullName': user.userFullName,
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
