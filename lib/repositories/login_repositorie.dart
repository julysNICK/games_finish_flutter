import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  static final LoginRepo _instance = LoginRepo._internal();

  factory LoginRepo() {
    return _instance;
  }

  LoginRepo._internal();

  static String returnError(e) {
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
          .get();

      return response.docs.isNotEmpty;
    } catch (e) {
      print(e);
      returnError(e);
    }
    return null;
  }

  static signinUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed in');
    } catch (e) {
      print(e);
      returnError(e);
      print('User not signed in');
      rethrow;
    }
  }
}
