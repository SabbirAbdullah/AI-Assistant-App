// BLoC Events
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String studentId;
  final String password;

  LoginSubmitted(this.studentId, this.password);
}

class ToggleRememberMe extends LoginEvent {
  final bool rememberMe;

  ToggleRememberMe(this.rememberMe);
}
