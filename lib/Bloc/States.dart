/// AuthenticationState
abstract class AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class UnauthenticatedState extends AuthenticationState {}

class CurrentScreenState{}