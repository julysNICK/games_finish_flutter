import '../repositories/games_repositorie.dart';

class GameService {
  static final GameService _instance = GameService._internal();

  factory GameService() {
    return _instance;
  }

  GameService._internal();

  Future<void> createGame(String? name, String? status) async {
    try {
      await GamesRepo().createGame(name, status);
    } catch (e) {
      throw Exception('Failed to create game');
    }
  }

  Future<List<Map<String, dynamic>>> getAllGames() async {
    try {
      final gamesAll = await GamesRepo().getAllGames();
      print(gamesAll);
      return gamesAll;
    } catch (e) {
      throw Exception('Failed to get all games');
    }
  }
}
