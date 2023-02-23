import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:games_finish/models/token.dart';

const String sharedSecret = 's3cr3t';

class JwtServices {
  UserToken user;

  JwtServices({required this.user});

  String senderCreateJwt() {
    final payload = {
      'token': user.getToken,
      'refreshToken': user.getRefreshToken,
    };

    JWT jwt = JWT(payload);

    return jwt.sign(SecretKey(sharedSecret),
        expiresIn: const Duration(days: 1));
  }

  bool verifyToken(String token) {
    try {
      JWT.verify(token, SecretKey(sharedSecret));
      return true;
    } catch (e) {
      return false;
    }
  }

  dynamic getPayload(String token) {
    try {
      return JWT.tryDecode(token);
    } catch (e) {
      return {};
    }
  }

  dynamic refreshJwt(String token) {
    try {
      final payload = getPayload(token);
      final jwt = JWT(payload);
      return jwt.sign(SecretKey(sharedSecret),
          expiresIn: const Duration(days: 1));
    } catch (e) {
      return '';
    }
  }
}
