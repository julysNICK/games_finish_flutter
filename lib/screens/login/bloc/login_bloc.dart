import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:games_finish/models/token.dart';
import 'package:games_finish/models/user_app_model.dart';
import 'package:games_finish/services/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool isFinish = false;
  LoginBloc()
      : super(LoginInitial(
            user: UserApp(email: "", name: "", numberPhoneUser: "", uid: ""))) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await LoginServices().register(event.email, event.password);

        emit(
          LoginSuccess(
            user: UserApp(email: event.email, name: "", numberPhoneUser: ""),
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
        isFinish = false;
      } catch (error) {
        emit(LoginFailure(
          error: error.toString(),
        ));
        isFinish = false;
      }
    });

    on<InitScreenHomeLoading>((event, emit) async {
      emit(LoginLoading());
      try {
        final User? token = await LoginServices().getToken();
        if (token != null) {
          emit(LoginSuccessGetUser(
            user: UserApp(
              email: token.email ?? token.email.toString(),
              name: token.displayName ?? token.displayName.toString(),
              numberPhoneUser:
                  token.phoneNumber ?? token.phoneNumber.toString(),
              uid: token.uid,
            ),
          ));
        } else {
          emit(LoginInitial(
              user:
                  UserApp(email: "", name: "", numberPhoneUser: "", uid: "")));
        }
      } catch (error) {
        emit(LoginFailure(
          error: error.toString(),
        ));
      }
    });
  }
}
