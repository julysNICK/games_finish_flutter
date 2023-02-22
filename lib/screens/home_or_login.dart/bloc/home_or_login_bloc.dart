import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_or_login_event.dart';
part 'home_or_login_state.dart';

class HomeOrLoginBloc extends Bloc<HomeOrLoginEvent, HomeOrLoginState> {
  HomeOrLoginBloc() : super(HomeOrLoginInitial()) {
    on<HomeOrLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
