class User {
  String userFullName;
  String userEmail;
  String userPhone;
  String userPassword;
  String userUid;

  User({
    required this.userFullName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
    required this.userUid,
  });

  get fullInfo => '$userFullName, $userEmail, $userPhone, $userPassword';
}
