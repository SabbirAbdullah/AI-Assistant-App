// Login BLoC
import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      // Simulate a login attempt
      await Future.delayed(Duration(seconds: 1));
      if (event.studentId.isEmpty ) {
        emit(LoginFailure('Student ID cannot be empty'));
        return;
      }
      if (event.password.isEmpty) {
        emit(LoginFailure('Password cannot be empty'));
        return;
      }
      // Simulate successful login
      emit(LoginSuccess());
    });

    on<ToggleRememberMe>((event, emit) {
      emit(LoginInitial(rememberMe: event.rememberMe));
    });
  }
}
