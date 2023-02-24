import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/services/register_services.dart';

import '../../../models/user_app_model.dart';
import '../../../models/user_model.dart';
import '../../../utils/throw_messa_error.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterServices _registerServices = RegisterServices();
  ThrowMessageFieldsUsers? throwMessageFieldsUsers;
  RegisterBloc()
      : super(RegisterInitialState(
            user: UserApp(email: "", name: "", numberPhoneUser: ""))) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoadingState(
        user:
            UserApp(email: event.user.userEmail, name: "", numberPhoneUser: ""),
      ));
      try {
        throwMessageFieldsUsers = ThrowMessageFieldsUsers(user: event.user);

        await _registerServices.register(event.user);
        emit(RegisterSuccessState(
          user: UserApp(
              email: event.user.userEmail, name: "", numberPhoneUser: ""),
        ));
      } catch (e) {
        emit(RegisterFailureState(
            message: e.toString(),
            user: UserApp(
                email: event.user.userEmail, name: "", numberPhoneUser: "")));
      }
    });
    on<RegisterClearEvent>((event, emit) async {
      emit(
        RegisterInitialState(
          user: UserApp(email: "", name: "", numberPhoneUser: ""),
        ),
      );
    });
  }
}
