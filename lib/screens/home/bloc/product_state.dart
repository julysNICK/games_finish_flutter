part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<GameModel> games;
  final List<GameModel> gamesListSearch;
  final String status;
  const ProductState(
      {this.games = const [],
      this.gamesListSearch = const [],
      this.status = 'all'});

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
  final String status;
  const ProductAddState(
      {required this.games,
      this.gamesListSearch = const [],
      this.status = 'all'});

  @override
  List<Object> get props => [games];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductGetSuccess extends ProductState {}

class ProductsUpdate extends ProductState {
  @override
  final List<GameModel> games;

  const ProductsUpdate({required this.games});

  @override
  List<Object> get props => [games];
}

class ProductbyStatus extends ProductState {
  @override
  final List<GameModel> games;

  const ProductbyStatus({required this.games});

  @override
  List<Object> get props => [games];
}
