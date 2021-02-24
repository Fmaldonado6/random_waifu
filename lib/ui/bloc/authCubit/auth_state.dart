import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  const AuthState();
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class AuthStateLogin extends AuthState {
  const AuthStateLogin();
}

class AuthStateCompleted extends AuthState {
  final User userInformation;

  const AuthStateCompleted(this.userInformation);
}

class AuthStateError extends AuthState {
  final String error;

  const AuthStateError(this.error);
}
