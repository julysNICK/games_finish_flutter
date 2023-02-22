part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  UserApp user;
  RegisterState({required this.user});

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {
  RegisterInitialState({required UserApp user}) : super(user: user);
}

class RegisterLoadingState extends RegisterState {
  RegisterLoadingState({required UserApp user}) : super(user: user);
}

class RegisterSuccessState extends RegisterState {
  RegisterSuccessState({required UserApp user}) : super(user: user);
}

class RegisterFailureState extends RegisterState {
  final String message;

  RegisterFailureState({required UserApp user, required this.message})
      : super(user: user);

  @override
  List<Object> get props => [message];
}
