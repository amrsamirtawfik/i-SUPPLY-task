import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class PastOrdersBloc extends Cubit<PastOrdersState> {
  PastOrdersBloc() : super(PastOrdersState());

  static PastOrdersBloc get(context) => BlocProvider.of(context);

  final List<Map<String, dynamic>> mockOrders = [];

  int calcPending() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["status"] == 'Pending') {
        total++;
      }
    }
    return total;
  }

  int calcApproved() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["status"] == 'Approved') {
        total++;
      }
    }
    return total;
  }

  int calcRejected() {
    int total = 0;
    for (var order in mockOrders) {
      if (order["status"] == 'Rejected') {
        total++;
      }
    }
    return total;
  }

  void addOrder(Map<String, dynamic> o) {
    mockOrders.add(o);
    print(mockOrders);

    emit(PastOrdersState());
  }
}

class Order {
  String id;
  String created;
  double totalPrice;
  int qty;
  String status;
  List<Map<String, dynamic>> cartItems;

  Order(this.id, this.created, this.totalPrice, this.qty, this.status,
      this.cartItems);

  void printOrderDetails() {
    print('Order ID: $id');
    print('Created Date: $created');
    print('Total Price: $totalPrice');
    print('Quantity: $qty');
    print('Status: $status');
    print('Cart Items:');
    for (var item in cartItems) {
      print('  Product Name: ${item["productName"]}');
      print('  Product Price: ${item["productPrice"]}');
      print('  Quantity: ${item["quantity"]}');
      print('  Image URL: ${item["imageUrl"]}');
      print('**************************');
    }
  }
}
