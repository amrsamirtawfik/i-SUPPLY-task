import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/InfoChip.dart';
import 'package:i_supply_task/ReUsableWidgets/ProgressTracker.dart';

import '../ReUsableWidgets/CartItemWidget.dart';

class TrackYourOrderScreen extends StatefulWidget {
  final Map<String, dynamic>? order;

  TrackYourOrderScreen({Key? key, this.order}) : super(key: key);

  @override
  _TrackYourOrderScreenState createState() => _TrackYourOrderScreenState();
}

class _TrackYourOrderScreenState extends State<TrackYourOrderScreen> {
  TextEditingController controller = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    if (widget.order == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter order ID',
                  prefixIcon: const Icon(Icons.search),
                  errorText: showError ? 'Order not found' : null,
                ),
              ),
              CustomButton(
                label: 'Search',
                onPressed: () {
                  String query = controller.text[0] == '#'
                      ? controller.text
                      : '#${controller.text}'; //add# to the query
                  final foundOrderIndex =
                      context.read<PastOrdersBloc>().findOrder(query);

                  if (foundOrderIndex == -1) {
                    // Show an error message when order is not found
                    setState(() {
                      showError = true;
                    });
                  } else {
                    // Navigate to the found order
                    Map<String, dynamic> order = context
                        .read<PastOrdersBloc>()
                        .mockOrders[foundOrderIndex];
                    context
                        .read<CurrentScreenBloc>()
                        .navToTrackYourOrder(order);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }

    Map<String, dynamic>? order = widget.order;
    dynamic cartItems = jsonDecode(order?["cartItems"]);

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                order?["ID"],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          ProgressTracker(
            currentStatus: order?["Status"],
          ),
          const Text(
            'Items',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  index: index,
                  liveCart: false,
                );
              },
            ),
          ),
          InfoChip(
            label: 'Created on: ${order?["Created"]}',
            iconData: Icons.access_time,
            backgroundColor: Color(0xFF4D6CAD),
          ),
          const SizedBox(
            height: 10,
          ),
          InfoChip(
            label: 'Total Price: EGP ${order?["Price"]}',
            iconData: Icons.money,
            backgroundColor: Color(0xFF4D6CAD),
          ),
          const SizedBox(
            height: 10,
          ),
          InfoChip(
            label: 'Total number of quantities: ${order?["Qty"]}',
            iconData: Icons.format_list_numbered,
            backgroundColor: Color(0xFF4D6CAD),
          ),
        ],
      ),
    );
  }
}
