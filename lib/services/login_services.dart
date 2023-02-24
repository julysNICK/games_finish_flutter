import 'package:games_finish/repositories/login_repositorie.dart';

class LoginServices {
  static final LoginServices _instance = LoginServices._internal();

  factory LoginServices() {
    return _instance;
  }

  LoginServices._internal();

  Future<void> register(String email, String password) async {
    try {
      bool? user = await LoginRepo().loginUser(email, password);
      await LoginRepo.signinUser(email, password);
      print(user);
    } catch (e) {
      throw Exception('Failed to register');
    }
  }

  Future<void> signOut() async {
    try {
      await LoginRepo.signOut();
    } catch (e) {
      throw Exception('Failed to sign out');
    }
  }
}
