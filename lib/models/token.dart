import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const String sharedSecret = 's3cr3t';

class UserToken {
  final String token;
  final String refreshToken;

  UserToken({required this.token, required this.refreshToken});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  String senderCreateJwt() {
    final payload = {
      'token': token,
      'refreshToken': refreshToken,
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
