part of 'home_or_login_bloc.dart';

abstract class HomeOrLoginState extends Equatable {
  const HomeOrLoginState();
  
  @override
  List<Object> get props => [];
}

class HomeOrLoginInitial extends HomeOrLoginState {}
