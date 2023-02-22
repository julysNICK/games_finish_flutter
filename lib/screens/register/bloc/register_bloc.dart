import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_finish/services/register_services.dart';

import '../../../models/user_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterServices _registerServices = RegisterServices();
  RegisterBloc() : super(RegisterInitialState());

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
