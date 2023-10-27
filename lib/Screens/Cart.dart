import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';
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
              child: Text(
                "Cart is empty",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ));
        }

        return ListView.builder(
            itemCount: CartBloc.get(context).cartList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 200.0, top: 25, right: 200, bottom: 25),
                child: Card(
                  color: Color(0xFFF1F1F1),
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              CartBloc.get(context).cartList[index]
                                      ["productName"] ??
                                  "",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              CartBloc.get(context).cartList[index]
                                      ["productPrice"] ??
                                  "",
                              style: TextStyle(fontSize: 16),
                            ),
                            leading: Image.network(
                              CartBloc.get(context).cartList[index]
                                      ["imageUrl"] ??
                                  "",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        QuantityChanger(
                          quantity: int.parse(CartBloc.get(context)
                              .cartList[index]["quantity"]!),
                          onButtonPressed: (capturedQuantity) {
                            CartBloc.get(context).changeQuantity(
                                index, capturedQuantity.toString());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
//ListView.builder(
//             itemCount: snapshot.data?.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(snapshot.data?[index]["productName"] ?? ""),
//                 subtitle: Text(snapshot.data?[index]["productPrice"] ?? ""),
//                 leading: Image.network(snapshot.data?[index]["imageUrl"] ?? ""),
//               );
//             },
//           );
