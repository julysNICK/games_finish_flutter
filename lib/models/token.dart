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
}
