import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/models/token.dart';
import 'package:games_finish/models/user_app_model.dart';
import 'package:games_finish/services/jwt_services.dart';
import 'package:games_finish/services/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(user: UserApp(email: "", password: ""))) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading(
          user: UserApp(
        email: event.email,
        password: event.password,
      )));
      try {
        final bool token =
            await LoginServices().register(event.email, event.password);

        final String jwtToken = JwtServices(
                user: UserToken(token: event.email, refreshToken: "teste1"))
            .senderCreateJwt();

        if (token == true) {
          emit(
            LoginSuccess(
              token: UserToken(
                refreshToken: jwtToken,
                token: jwtToken,
              ),
              user: UserApp(email: event.email, password: event.password),
            ),
          );
        }
      } catch (error) {
        emit(LoginFailure(
            error: error.toString(),
            user: UserApp(
              email: "",
              password: "",
            )));
      }
    });
  }
}
