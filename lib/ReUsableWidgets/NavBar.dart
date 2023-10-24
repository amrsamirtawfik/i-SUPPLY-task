import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onTabTapped(int index) {
    currentScreenBloc.changeIndex(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreenBloc.currentScreenIndex,
      onTap: _onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Medicines'),
        BottomNavigationBarItem(
          icon: Icon(Icons.track_changes),
          label: 'Track your order',
        ),
      ],
    );
  }
}
