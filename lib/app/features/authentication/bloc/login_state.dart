// BLoC States
abstract class LoginState {}
class LoginInitial extends LoginState {
  final bool rememberMe;

  LoginInitial({this.rememberMe = false});
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}
