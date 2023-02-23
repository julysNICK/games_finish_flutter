import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/models/game_model.dart';
import 'package:games_finish/services/games_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<GameModel> gamesList = [];
  ProductBloc() : super(const ProductInitial()) {
    on<ProductAdd>((event, emit) async {
      emit(ProductLoading());
      try {
        await GameService().createGame(event.games.title, event.games.status);
        gamesList.add(event.games);
        emit(
          ProductAddState(
            games: gamesList,
          ),
        );
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });

    on<GetAllProducts>((event, emit) async {
      print("chame event");
      emit(ProductLoading());
      try {
        final gamesAll = await GameService().getAllGames();
        for (var element in gamesAll) {
          gamesList.add(GameModel(
            image: "assets/images/ps5.png",
            title: element['name'],
            status: element['status'],
          ));
        }

        emit(
          ProductAddState(
            games: gamesList,
          ),
        );
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }

  get games => gamesList;
}
