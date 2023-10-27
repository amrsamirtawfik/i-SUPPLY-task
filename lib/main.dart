
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Screens/LoginScreen.dart';

void main() {
  runApp(BlocProvider(
    create: (context)=>CartBloc(),
    child: MaterialApp(
      home: LoginScreen(),
    ),
  ));
}
