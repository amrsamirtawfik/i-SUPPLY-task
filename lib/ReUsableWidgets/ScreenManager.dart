import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/Screens/Medecines.dart';
import 'package:i_supply_task/Screens/TrackYourOrder.dart';

import '../Screens/Cart.dart';
import '../Screens/Home.dart';

class ScreenManager extends StatefulWidget {
  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  int index = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    MedecinesScreen(),
    TrackYourOrderScreen(),
    Cart(),
    // Add your other screens here
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentScreenBloc, CurrentScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrackYourOrderScreenState) {
            Map<String, dynamic> capturedOrder = state.order;
            return TrackYourOrderScreen(order: capturedOrder);
          }
          return _screens[CurrentScreenBloc.get(context).currentScreenIndex];
        });
  }
}
