import '../repositories/games_repositorie.dart';

class GameService {
  static final GameService _instance = GameService._internal();

  factory GameService() {
    return _instance;
  }

  GameService._internal();

  Future<void> createGame(String? name, String? status, String? userId) async {
    try {
      await GamesRepo().createGame(name, status, userId);
    } catch (e) {
      throw Exception('Failed to create game');
    }
  }

  Future<List<Map<String, dynamic>>> getAllGames(String uid) async {
    try {
      final gamesAll = await GamesRepo().getAllGames(uid);
      return gamesAll;
    } catch (e) {
      throw Exception('Failed to get all games');
    }
  }
}
