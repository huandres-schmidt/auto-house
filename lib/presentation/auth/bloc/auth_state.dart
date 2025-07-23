abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final String name;

  Authenticated(this.name);
}

class Unauthenticated extends AuthState {}
