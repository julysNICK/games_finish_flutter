part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  User user;

  RegisterButtonPressed({
    required this.user,
  });

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RegisterButtonPressed { user: ${user.fullInfo} }';
}

class RegisterClearEvent extends RegisterEvent {
  @override
  String toString() => 'RegisterClearEvent';
}
