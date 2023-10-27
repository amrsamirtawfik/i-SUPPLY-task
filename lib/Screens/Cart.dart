import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cartBloc.cartStream,
      builder: (context, snapshot) {
        print(snapshot.toString());
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]["productName"] ?? ""),
                subtitle: Text(snapshot.data?[index]["productPrice"] ?? ""),
                leading: Image.network(snapshot.data?[index]["imageUrl"] ?? ""),
              );
            },
          );
        }

        return const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Cart is empty",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ));
      },
    );
  }
}
