part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final UserApp user = UserApp(email: "", password: "");
  final UserToken token = UserToken(token: "", refreshToken: "");
  LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  UserApp user;
  LoginInitial({required this.user});
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginSuccess extends LoginState {
  final UserToken token;

  @override
  final UserApp user;

  LoginSuccess({required this.token, required this.user});

  @override
  List<Object> get props => [token, user];

  @override
  String toString() => 'LoginSuccess { token: $token }';
}
