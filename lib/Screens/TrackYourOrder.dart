import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/ReUsableWidgets/ProgressTracker.dart';

import '../ReUsableWidgets/CartItemWidget.dart';

class TrackYourOrderScreen extends StatelessWidget {
  Map<String, dynamic>? order;

  TrackYourOrderScreen({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    if (order == null) {
      return Text('Enter order ID');
    }
    dynamic cartItems = jsonDecode(order?["cartItems"]);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressTracker(
            currentStep: 1,
            approved: false,
          ),
          const Text(
            'Your products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  index: index,
                  liveCart: false, // Provide the liveCart value
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
