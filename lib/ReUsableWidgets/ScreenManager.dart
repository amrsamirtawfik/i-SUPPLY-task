import 'package:flutter/cupertino.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
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
    return StreamBuilder<Object>(
        stream: currentScreenBloc.currentScreenStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return _screens[int.parse(snapshot.data.toString())];
          }
          return _screens[index];
        });
  }
}
