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
      print('ProductAdd');
      emit(ProductLoading());

      try {
        await GameService().createGame(
            event.games.title, event.games.status, event.games.userUid);
        gamesList.add(event.games);

        emit(
          ProductAddState(
            games: gamesList,
          ),
        );
        emit(ProductGetSuccess());
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });

    on<PressButtonStatusSwitch>((event, emit) async {
      print('PressButtonStatusSwitch');
      emit(ProductLoading());
      print(event.status);
      if (gamesList.isNotEmpty) {
        if (event.status == 'all') {
          print(gamesList);
          emit(
            ProductAddState(
              games: gamesList,
            ),
          );
        } else {
          emit(
            ProductAddState(
                games: gamesList
                    .where((element) =>
                        element.status
                            .replaceAll(
                              RegExp(r'\s+'),
                              '',
                            )
                            .toLowerCase() ==
                        event.status
                            .replaceAll(
                              RegExp(r'\s+'),
                              '',
                            )
                            .toLowerCase())
                    .toList()),
          );
        }
      }
    });

    on<GetAllProducts>((event, emit) async {
      print('GetAllProducts');
      emit(ProductLoading(
        isLoading: true,
      ));
      try {
        final gamesAll = await GameService().getAllGames(event.uid);

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

    on<ProductClearWhenLogout>((event, emit) async {
      print('ProductClearWhenLogout');
      gamesList.clear();
      emit(
        ProductAddState(
          games: gamesList,
        ),
      );
    });
  }

  get games => gamesList;
}
