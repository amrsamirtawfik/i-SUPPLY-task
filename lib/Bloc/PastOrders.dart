import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

import '../ReUsableWidgets/OrdersList.dart';

class PastOrdersBloc extends Cubit<PastOrdersState> {
  PastOrdersBloc() : super(PastOrdersState());

  static PastOrdersBloc get(context) => BlocProvider.of(context);

  final List<Order> mockOrders = [
    Order('#211221', '21/10/2023', 100.0, 5, 'Approved',[]),
    Order('#211222', '22/10/2023', 75.0, 3, 'Rejected',[]),
    Order('#211223', '23/10/2023', 50.0, 2, 'Pending',[]),

  ];

  int calcPending() {
    int total = 0;
    for (var order in mockOrders) {
      if (order.status == 'Pending') {
        total++;
      }
    }
    return total;
  }

  int calcApproved() {
    int total = 0;
    for (var order in mockOrders) {
      if (order.status == 'Approved') {
        total++;
      }
    }
    return total;
  }

  int calcRejected() {
    int total = 0;
    for (var order in mockOrders) {
      if (order.status == 'Rejected') {
        total++;
      }
    }
    return total;
  }

  void addOrder(Order o) {
    mockOrders.add(o);
    emit(PastOrdersState());
  }
}
class Order {
  final String id;
  final String created;
  final double totalPrice;
  final int qty;
  final String status;
  final List<CartObject> cartItems;

  Order(this.id, this.created, this.totalPrice, this.qty, this.status,this.cartItems);
}
