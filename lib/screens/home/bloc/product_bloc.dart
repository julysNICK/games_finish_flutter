import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/models/game_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ProductAdd>((event, emit) {
      emit(ProductAddState(games: [...state.games, event.games]));
    });

    on<ProductRemove>((event, emit) {
      emit(
        ProductAddState(
          games:
              state.games.where((element) => element != event.games).toList(),
        ),
      );
    });

    on<ListProductByStatus>((event, emit) {
      emit(
        ProductListByStatusState(
          games: state.games
              .where((element) => element.status == event.status)
              .toList(),
        ),
      );
    });
  }
}
