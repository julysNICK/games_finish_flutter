class GameModel {
  String image;
  String title;
  String status;
  String? userUid;

  GameModel({
    required this.image,
    required this.title,
    required this.status,
    this.userUid,
  });
}
