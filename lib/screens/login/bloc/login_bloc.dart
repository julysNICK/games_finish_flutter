import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/models/token.dart';
import 'package:games_finish/models/user_app_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = _login(event.email, event.password);
        emit(
          LoginSuccess(
            token: UserToken(
              refreshToken: token,
              token: token,
            ),
            user: UserApp(email: event.email, password: event.password),
          ),
        );
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }

  String _login(String email, String password) {
    return "token";
  }
}
