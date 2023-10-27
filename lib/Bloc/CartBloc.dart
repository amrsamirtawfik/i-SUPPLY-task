// AuthenticationBloc
import 'dart:async';



class CartBloc {
  final _cartController = StreamController<List<Map<String, String>>>();

  Stream<List<Map<String, String>>> get cartStream =>
      _cartController.stream;
  List<Map<String,String>> cartList=[];
  void addProductToCart(Map<String, String> cartObject) {
    print('added :$cartObject');
    cartList.add(cartObject);
    _cartController.add(cartList);
  }

  // Dispose the StreamController when it's no longer needed
  void dispose() {
    _cartController.close();
  }
}

final cartBloc = CartBloc(); // Create a single instance, to use it later
