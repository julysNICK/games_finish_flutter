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

class GetAllProducts extends ProductEvent {
  String uid;

  GetAllProducts({required this.uid});
}

class ProductClearWhenLogout extends ProductEvent {}

class PressButtonStatusSwitch extends ProductEvent {
  final int index;

  const PressButtonStatusSwitch({required this.index});

  @override
  List<Object> get props => [index];
}

class CallLoading extends ProductEvent {}

class SetDefaultState extends ProductEvent {}
