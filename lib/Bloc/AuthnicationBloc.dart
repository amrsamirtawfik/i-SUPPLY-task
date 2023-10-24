// AuthenticationBloc
import 'dart:async';

import 'States.dart';

class AuthenticationBloc {
  final _authenticationController = StreamController<AuthenticationState>();

  Stream<AuthenticationState> get authenticationStream =>
      _authenticationController.stream;

  void login(String username, String password) {
    if (username == 'admin' && password == '1234') {
      _authenticationController.add(AuthenticatedState());
    } else {
      _authenticationController.add(UnauthenticatedState());
    }
  }

  // Dispose the StreamController when it's no longer needed
  void dispose() {
    _authenticationController.close();
  }
}

final authenticationBloc = AuthenticationBloc(); // Create a single instance, to use it later
