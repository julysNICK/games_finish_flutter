import '../repositories/games_repositorie.dart';

class GameService {
  static final GameService _instance = GameService._internal();

  factory GameService() {
    return _instance;
  }

  GameService._internal();

  Future<void> createGame(String? name, String? description) async {
    try {
      await GamesRepo().createGame(name, description);
    } catch (e) {
      throw Exception('Failed to create game');
    }
  }
}
