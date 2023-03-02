part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<GameModel> games;
  final List<GameModel> gamesListSearch;
  final String status;
  final int index;

  const ProductState(
      {this.games = const [],
      this.gamesListSearch = const [],
      this.status = 'all',
      this.index = 0});

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  @override
  final List<GameModel> games;

  const ProductInitial({this.games = const []});
}

class ProductLoading extends ProductState {
  bool isLoading;

  ProductLoading({this.isLoading = true});
}

class ProductAddState extends ProductState {
  @override
  final List<GameModel> games;
  @override
  final List<GameModel> gamesListSearch;

  @override
  final int index;

  @override
  final String status;
  const ProductAddState({
    required this.games,
    this.gamesListSearch = const [],
    this.status = 'all',
    this.index = 0,
  });

  @override
  List<Object> get props => [games];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
