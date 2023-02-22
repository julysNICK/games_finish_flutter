part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  UserApp user;

  LoginState({required this.user});

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial({required UserApp user}) : super(user: user);
}

class LoginLoading extends LoginState {
  LoginLoading({required UserApp user}) : super(user: user);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error, required UserApp user})
      : super(user: user);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginSuccess extends LoginState {
  final UserToken token;

  @override
  final UserApp user;

  LoginSuccess({required this.token, required this.user}) : super(user: user);

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoginSuccess { token: $token }';
}
