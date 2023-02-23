import 'package:cloud_firestore/cloud_firestore.dart';

class LoginRepo {
  static final LoginRepo _instance = LoginRepo._internal();

  factory LoginRepo() {
    return _instance;
  }

  LoginRepo._internal();

  String returnError(e) {
    return e;
  }

  Future<bool?> loginUser(String? email, String? password) async {
    try {
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: email!,
      //   password: password!,
      // );

      QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
          .instance
          .collection('users')
          .where('userEmail', isEqualTo: email)
          .where('userPassword', isEqualTo: password)
          .get();

      return response.docs.isNotEmpty;
    } catch (e) {
      print(e);
      returnError(e);
    }
    return null;
  }
}
