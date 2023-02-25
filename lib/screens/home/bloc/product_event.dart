part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductAdd extends ProductEvent {
  final GameModel games;

  const ProductAdd({required this.games});

  @override
  List<Object> get props => [games];
}

class ProductAddInFirebase extends ProductEvent {
  final GameModel games;

  const ProductAddInFirebase({required this.games});

  @override
  List<Object> get props => [games];
}

class ProductRemove extends ProductEvent {
  final GameModel games;

  const ProductRemove({required this.games});

  @override
  List<Object> get props => [games];
}

class ListProductByStatus extends ProductEvent {
  final String status;

  const ListProductByStatus({required this.status});

  @override
  List<Object> get props => [status];
}

class GetAllProducts extends ProductEvent {
  String uid;

  GetAllProducts({required this.uid});
}

class ProductClearWhenLogout extends ProductEvent {}
