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
    } catch (e) {
      print(e);
      returnError(e);
      print('User not signed in');
      rethrow;
    }
  }

  static getToken() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.getIdToken();
        return user;
      }
    } catch (e) {
      rethrow;
    }
  }

  static signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out');
    } catch (e) {
      print(e);
      returnError(e);
      print('User not signed out');
      rethrow;
    }
  }
}
