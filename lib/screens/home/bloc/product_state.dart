part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  final List<GameModel> games;
  const ProductState({this.games = const []});

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  @override
  final List<GameModel> games;

  const ProductInitial({this.games = const []});
}

class ProductLoading extends ProductState {}

class ProductAddState extends ProductState {
  @override
  final List<GameModel> games;

  const ProductAddState({required this.games});

  @override
  List<Object> get props => [games];
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductListByStatusState extends ProductState {
  @override
  final List<GameModel> games;

  const ProductListByStatusState({required this.games});

  @override
  List<Object> get props => [games];
}

class ProductsUpdate extends ProductState {
  @override
  final List<GameModel> games;

  const ProductsUpdate({required this.games});

  @override
  List<Object> get props => [games];
}
