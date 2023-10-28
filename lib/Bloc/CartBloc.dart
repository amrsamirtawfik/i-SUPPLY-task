import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class CartBloc extends Cubit<CartState> {
  CartBloc() : super(CartState());

  static CartBloc get(context) => BlocProvider.of(context);

  List<Map<String,dynamic>> cartList = [];

  int productInCart(String productName) {
    return cartList
        .indexWhere((element) => element["productName"] == productName);
  }

  void addProductToCart(Map<String,dynamic> cartObject) {


    cartList.add(cartObject);
    emit(CartState());
  }

  void changeQuantity(index, newQuantity) {
    cartList[index]["quantity"] = newQuantity;
    emit(CartState());
  }

  void deleteCartObject(index) {
    cartList.removeAt(index);
    emit(CartState());
  }

  void clearCart() {
    cartList.clear();
    emit(CartState());
  }

  double sumOfPrices() {
    double sum = 0;
    for (var item in cartList) {
      sum += double.parse(item["productPrice"]!) * double.parse(item["quantity"]!);
    }
    return sum;
  }

  int sumOfQuantities() {
    int sum = 0;
    for (var item in cartList) {
      sum += int.parse(item["quantity"]!);
    }
    return sum;
  }
}

class CartObject {
  String productName;
  String productPrice;
  String imageUrl;
  String quantity;

  CartObject(
      {required this.productName,
      required this.productPrice,
      required this.imageUrl,
      required this.quantity});
}
