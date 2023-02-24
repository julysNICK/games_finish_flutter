import 'package:cloud_firestore/cloud_firestore.dart';

class GamesRepo {
  static final GamesRepo _instance = GamesRepo._internal();

  factory GamesRepo() {
    return _instance;
  }

  GamesRepo._internal();

  String returnError(e) {
    return e;
  }

  Future<List<Map<String, dynamic>>> getGames() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection('games').get();

      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      print(e);
      returnError(e);
    }
    return [];
  }

  Future<void> createGame(String? name, String? status) async {
    try {
      await FirebaseFirestore.instance
          .collection('games')
          .add({'name': name, 'status': status});
    } catch (e) {
      print(e);
      returnError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAllGames() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response =
          await FirebaseFirestore.instance.collection('games').get();

      return response.docs.map((e) => e.data()).toList();
    } catch (e) {
      print(e);
      returnError(e);
    }
    return [];
  }
}
