import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_supply_task/ReUsableWidgets/NavBar.dart';
import 'package:i_supply_task/ReUsableWidgets/ScreenManager.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenManager(),
      bottomNavigationBar: NavBar(),
    );
  }

}