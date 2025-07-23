abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class AuthNameSubmitted extends AuthEvent {
  final String name;

  AuthNameSubmitted(this.name);
}
