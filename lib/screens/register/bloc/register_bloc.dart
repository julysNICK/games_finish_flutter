import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/services/register_services.dart';

import '../../../models/user_model.dart';
import '../../../utils/throw_messa_error.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterServices _registerServices = RegisterServices();
  ThrowMessageFieldsUsers? throwMessageFieldsUsers;
  RegisterBloc() : super(RegisterInitialState()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        throwMessageFieldsUsers = ThrowMessageFieldsUsers(user: event.user);

        await _registerServices.register(event.user);
        emit(RegisterSuccessState());
      } catch (e) {
        emit(RegisterFailureState(message: e.toString()));
      }
    });
    on<RegisterClearEvent>((event, emit) async {
      emit(RegisterInitialState());
    });
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoadingState();
      try {
        await _registerServices.register(event.user);
        yield RegisterSuccessState();
      } catch (e) {
        yield RegisterFailureState(message: e.toString());
      }
    } else if (event is RegisterClearEvent) {
      yield RegisterInitialState();
    }
  }
}
