import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/OrdersList.dart';
import 'package:i_supply_task/ReUsableWidgets/QuantityChanger.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        print('state: $state');
      },
      builder: (context, state) {
        if (CartBloc.get(context).cartList.isEmpty) {
          return const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 700,
                    ),
                    Text(
                      "Your shopping cart is empty!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Navigate to medicines and add a drug.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: CartBloc.get(context).cartList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 200.0, top: 25, right: 200, bottom: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: const Color(0xFFF1F1F1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.all(16),
                                        title: Text(
                                          CartBloc.get(context).cartList[index]
                                              ["productName"],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          'EGP ${CartBloc.get(context).cartList[index]["productPrice"]}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        leading: Image.network(
                                          CartBloc.get(context).cartList[index]
                                              ["imageUrl"],
                                          width: 80,
                                          height: 80,
                                        ),
                                      ),
                                    ),
                                    QuantityChanger(
                                      quantity: int.parse(CartBloc.get(context)
                                          .cartList[index]["quantity"]),
                                      onButtonPressed: (capturedQuantity) {
                                        CartBloc.get(context).changeQuantity(
                                            index, capturedQuantity.toString());
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                              color: const Color(0xFFF1F1F1),
                              child: IconButton(
                                  onPressed: () {
                                    CartBloc.get(context)
                                        .deleteCartObject(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  )))
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(
              //black line below the carts
              height: 2,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 650.0, top: 75, bottom: 75),
              child: Column(
                children: [
                  Text(
                    'Total: EGP ${CartBloc.get(context).sumOfPrices().toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  CustomButton(
                      label: 'Place Order',
                      onPressed: () {
                        int rand = (Random().nextInt(900000) + 100000);
                        Map<String,dynamic> order={
                          "ID": '#$rand',
                          "Created": DateFormat('dd/MM/yyyy').format(DateTime.now()),
                          "Qty": CartBloc.get(context).sumOfQuantities(),
                          "Price":CartBloc.get(context).sumOfPrices(),
                          "Status":'Pending',
                          "cartItems":   jsonEncode(CartBloc.get(context).cartList),
                          
                        };
                        context.read<PastOrdersBloc>().addOrder(order);

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Your order has been placed! \nTrack it with this number: $rand'),
                                      CustomButton(
                                          label: 'Close',
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  ),
                                ),
                              );
                            });
                        CartBloc.get(context).clearCart();
                      })
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
