import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_supply_task/Screens/LoginScreen.dart';

class LeftMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF4D6CAD)),
            accountName: Text("Amr Samir"),
            accountEmail: Text("amrsamirtawfik@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle Home menu item click
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle Settings menu item click
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle Logout menu item click
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));

            },
          ),
        ],
      ),
    );
  }
}