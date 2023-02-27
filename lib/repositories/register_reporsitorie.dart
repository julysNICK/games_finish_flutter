import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:games_finish/models/user_model.dart' as UserModel;

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

  static Future<void> registerUserInDatabase(UserModel.User? user, uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'userFullName': user!.userFullName,
        'userEmail': user.userEmail,
        'userPhone': user.userPhone,
        'userPassword': user.userUid,
      });
    } catch (e) {
      print(e);
    }
  }

  static signUpUser(UserModel.User? userApp) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userApp!.userEmail, password: userApp.userPassword);

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(userApp.userFullName);
        await userCredential.user!.updateEmail(userApp.userEmail);
        await userCredential.user!.updatePassword(userApp.userPassword);

        await registerUserInDatabase(userApp, userCredential.user!.uid);
        await userCredential.user!.reload();
        await userCredential.user
            ?.sendEmailVerification()
            .then((value) => print('Email sednt'));
        await userCredential.user!.sendEmailVerification();
      }
    } catch (e) {
      print(e);
    }
  }
}
