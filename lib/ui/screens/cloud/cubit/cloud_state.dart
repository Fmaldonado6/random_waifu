import 'package:firebase_auth/firebase_auth.dart';

abstract class CloudState {
  const CloudState();
}

class CloudStateInitial extends CloudState {
  const CloudStateInitial();
}

class CloudStateLogin extends CloudState {
  const CloudStateLogin();
}

class CloudStateCompleted extends CloudState {
  final User userInformation;

  const CloudStateCompleted(this.userInformation);
}

class CloudStateError extends CloudState {
  final String error;

  const CloudStateError(this.error);
}
