import 'package:flutter/material.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/ReUsableWidgets/OrdersList.dart';
import 'package:i_supply_task/Screens/Medecines.dart';

import '../ReUsableWidgets/CustomButton.dart';
import 'Cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(left: 75, top: 25, right: 75, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardLabels(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your orders',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            OrdersSection(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'New order',
              onPressed: () {
                currentScreenBloc.changeIndex(1);
              },
            )
          ],
        ));
  }
}
