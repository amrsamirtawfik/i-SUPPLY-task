import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomAppBar.dart';
import 'package:i_supply_task/ReUsableWidgets/NavBar.dart';
import 'package:i_supply_task/ReUsableWidgets/ScreenManager.dart';

import '../ReUsableWidgets/LeftMenu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0), child: CustomAppBar()),
      body: ScreenManager(),
      drawer: LeftMenu(),
      bottomNavigationBar: NavBar(),
    );
  }
}
