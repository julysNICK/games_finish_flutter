class User {
  String userFullName;
  String userEmail;
  String userPhone;
  String userPassword;

  User({
    required this.userFullName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
  });

  get fullInfo => '$userFullName, $userEmail, $userPhone, $userPassword';
}
