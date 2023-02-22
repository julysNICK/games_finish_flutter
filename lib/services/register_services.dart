import '../models/user_model.dart';
import '../repositories/register_reporsitorie.dart';

class RegisterServices {
  static final RegisterServices _instance = RegisterServices._internal();

  factory RegisterServices() {
    return _instance;
  }

  RegisterServices._internal();

  Future<void> register(User user) async {
    try {
      RegisterUser.instance!.registerUser(user);
    } catch (e) {
      throw Exception('Failed to register');
    }
  }
}
