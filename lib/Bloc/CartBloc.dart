import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class CartBloc extends Cubit<CartState> {
  CartBloc() : super(CartState());

  static CartBloc get(context) => BlocProvider.of(context);

  List<Map<String, String>> cartList = [];

  int productInCart(String productName) {
    return cartList
        .indexWhere((element) => element["productName"] == productName);
  }

  void addProductToCart(Map<String, String> cartObject) {
    print('added :$cartObject');

    cartList.add(cartObject);
    emit(CartState());
  }

  void changeQuantity(index, newQuantity) {
    cartList[index]["quantity"] = newQuantity;
    emit(CartState());
  }
}
