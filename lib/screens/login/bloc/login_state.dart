part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final UserApp user =
      UserApp(email: "", name: "", numberPhoneUser: "", uid: "");
  final UserToken token = UserToken(token: "", refreshToken: "");
  final String error = "";

  LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  UserApp user;
  @override
  String error = "";
  LoginInitial({required this.user, this.error = ""});
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginFailure extends LoginState {
  @override
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginSuccess extends LoginState {
  @override
  final UserApp user;

  LoginSuccess({required this.user});

  @override
  List<Object> get props => [token, user];

  @override
  String toString() => 'LoginSuccess { token: $token }';
}

class SignOutSuccess extends LoginState {
  SignOutSuccess();
}

class InitScreenHomeLoadingSuccess extends LoginState {
  @override
  final UserApp user;

  InitScreenHomeLoadingSuccess({required this.user});

  @override
  List<Object> get props => [token, user];

  @override
  String toString() => 'LoginSuccess { token: $token }';
}
