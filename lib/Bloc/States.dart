import 'PastOrders.dart';

/// AuthenticationState
abstract class AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class UnauthenticatedState extends AuthenticationState {}

///CurrentScreen State
class CurrentScreenState {}

class TrackYourOrderScreenState extends CurrentScreenState{
  Map<String, dynamic> order;

  TrackYourOrderScreenState({required this.order});
}

///Cart State
class CartState {}

///Past orders state
class PastOrdersState {}

class AddedOrderToPastOrdersState extends PastOrdersState {
  List<Order> orders;
  Map<String, dynamic> cartItems;

  AddedOrderToPastOrdersState({required this.orders, required this.cartItems});
}
