import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onTabTapped(int index) {
    CurrentScreenBloc.get(context).changeIndex(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentScreenBloc, CurrentScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: CurrentScreenBloc.get(context).currentScreenIndex,
          selectedItemColor: const Color(0xFF4D6CAD),
          unselectedItemColor: Colors.black54,
          unselectedLabelStyle: const TextStyle(color: Colors.black54),
          showSelectedLabels: true,
          // Show selected labels
          showUnselectedLabels: true,
          // Show unselected labels

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
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        );
      },
    );
  }
}
