import 'package:firebase_auth/firebase_auth.dart';
import 'package:games_finish/repositories/login_repositorie.dart';

class LoginServices {
  static final LoginServices _instance = LoginServices._internal();

  factory LoginServices() {
    return _instance;
  }

  LoginServices._internal();

  Future<User?> register(String email, String password) async {
    try {
      // bool? user = await LoginRepo().loginUser(email, password);
      User? user = await LoginRepo.signinUser(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await LoginRepo.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getToken() async {
    try {
      User? user = await LoginRepo.getToken();
      if (user != null) {
        return user;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
