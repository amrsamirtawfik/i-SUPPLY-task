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

import '../ReUsableWidgets/CartItemWidget.dart';

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
                  return CartItemWidget(
                    cartItem: CartBloc.get(context).cartList[index],
                    index: index,
                    liveCart: true, // Provide the liveCart value
                  );
                },
              ),
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
