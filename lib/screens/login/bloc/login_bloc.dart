import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:games_finish/models/token.dart';
import 'package:games_finish/models/user_app_model.dart';
import 'package:games_finish/services/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(user: UserApp(email: "", name: ""))) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        await LoginServices().register(event.email, event.password);

        emit(
          LoginSuccess(
            user: UserApp(
              email: event.email,
              name: "",
            ),
          ),
        );
      } catch (error) {
        emit(LoginFailure(
          error: "Erro ao logar verifique seus dados",
        ));
      }
    });

    on<SignOutButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await LoginServices().signOut();
        emit(SignOutSuccess());
      } catch (error) {
        emit(LoginFailure(
          error: error.toString(),
        ));
      }
    });

    on<InitScreenHomeLoading>((event, emit) async {
      print("dentro do bloc");
      emit(LoginLoading());
      try {
        final User? token = await LoginServices().getToken();
        if (token != null) {
          emit(LoginSuccess(
            user: UserApp(
              email: token.email ?? token.email.toString(),
              name: token.displayName ?? token.displayName.toString(),
            ),
          ));
        } else {
          emit(LoginInitial(user: UserApp(email: "", name: "")));
        }
      } catch (error) {
        emit(LoginFailure(
          error: error.toString(),
        ));
      }
    });
  }
}
