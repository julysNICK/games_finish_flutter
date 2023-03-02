import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/models/game_model.dart';
import 'package:games_finish/services/games_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<GameModel> gamesList = [];
  List<GameModel> gameListSearch = [];
  ProductBloc() : super(const ProductInitial()) {
    on<ProductAdd>((event, emit) async {
      emit(ProductLoading());

      try {
        await GameService().createGame(
            event.games.title, event.games.status, event.games.userUid);
        gamesList.add(event.games);

        emit(
          ProductAddState(
              games: gamesList, gamesListSearch: gamesList, status: 'all'),
        );
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });

    on<PressButtonStatusSwitch>((event, emit) async {
      emit(ProductLoading());
      gameListSearch = gamesList;
      switch (event.index) {
        case 0:
          emit(
            ProductAddState(
              games: gamesList,
              gamesListSearch: gamesList,
              status: 'all',
              index: event.index,
            ),
          );
          break;
        case 1:
          emit(
            ProductAddState(
              games: gamesList,
              gamesListSearch: gameListSearch
                  .where((element) =>
                      element.status
                          .replaceAll(
                            RegExp(r'\s+'),
                            '',
                          )
                          .toLowerCase() ==
                      'inprogress')
                  .toList(),
              status: 'inprogress',
              index: event.index,
            ),
          );
          break;
        case 2:
          emit(
            ProductAddState(
              games: gamesList,
              gamesListSearch: gameListSearch
                  .where((element) =>
                      element.status
                          .replaceAll(
                            RegExp(r'\s+'),
                            '',
                          )
                          .toLowerCase() ==
                      'completed')
                  .toList(),
              status: 'completed',
              index: event.index,
            ),
          );
          break;
        case 3:
          emit(
            ProductAddState(
              games: gamesList,
              gamesListSearch: gameListSearch
                  .where((element) =>
                      element.status
                          .replaceAll(
                            RegExp(r'\s+'),
                            '',
                          )
                          .toLowerCase() ==
                      'platinum')
                  .toList(),
              status: 'platinum',
              index: event.index,
            ),
          );
          break;
        default:
          emit(
            ProductAddState(
              games: gamesList,
              gamesListSearch: gamesList,
              status: 'all',
              index: event.index,
            ),
          );
      }
    });

    on<GetAllProducts>((event, emit) async {
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
            gamesListSearch: gamesList,
            status: 'all',
          ),
        );
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });

    on<SetDefaultState>((event, emit) async {
      print("set default state");
      print("gamesListDefault: $gamesList");
      emit(
        ProductAddState(
          games: gamesList,
          gamesListSearch: gamesList,
          status: 'all',
        ),
      );
    });

    on<ProductClearWhenLogout>((event, emit) async {
      gamesList.clear();
      gameListSearch.clear();
      emit(
        ProductAddState(
          games: gamesList,
        ),
      );
    });

    on<CallLoading>((event, emit) async {
      emit(ProductLoading(
        isLoading: true,
      ));
    });
  }

  get games => gamesList;
}
