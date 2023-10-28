import 'package:flutter/material.dart';

import '../Bloc/CartBloc.dart';
import 'QuantityChanger.dart';

class CartItemWidget extends StatelessWidget {
  final Map<String, dynamic> cartItem;
  final int index;
  final bool liveCart;

  CartItemWidget(
      {required this.cartItem, required this.index, required this.liveCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 200.0, top: 25, right: 200, bottom: 25),
      child: Row(
        children: [
          liveCart
              ? const SizedBox()
              : Card(
                  color: const Color(0xFFF1F1F1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${cartItem['quantity']} x',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
          Expanded(
            child: Card(
              color: const Color(0xFFF1F1F1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          cartItem["productName"] ?? "",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'EGP ${cartItem["productPrice"] ?? ""}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        leading: Image.network(
                          cartItem["imageUrl"] ?? "",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    liveCart
                        ? QuantityChanger(
                            quantity: int.parse(cartItem["quantity"] ?? "0"),
                            onButtonPressed: (capturedQuantity) {
                              CartBloc.get(context).changeQuantity(
                                  index, capturedQuantity.toString());
                            },
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
          liveCart
              ? Card(
                  color: const Color(0xFFF1F1F1),
                  child: IconButton(
                    onPressed: () {
                      CartBloc.get(context).deleteCartObject(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
