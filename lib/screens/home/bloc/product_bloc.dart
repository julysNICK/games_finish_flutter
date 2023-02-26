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
      emit(ProductLoading());

      switch (event.index) {
        case 0:
          emit(
            ProductAddState(
              games: gamesList,
            ),
          );
          break;
        case 1:
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
                      'inprogress')
                  .toList(),
            ),
          );
          break;
        case 2:
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
                      'completed')
                  .toList(),
            ),
          );
          break;
        case 3:
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
                      'platinum')
                  .toList(),
            ),
          );
          break;
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
      gamesList.clear();
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
