
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/Screens/LoginScreen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CartBloc>(create: (context) => CartBloc()),
      BlocProvider<PastOrdersBloc>(create: (context) => PastOrdersBloc()),
    ],
    child: MaterialApp(
      home: LoginScreen(),
    ),
  ));
}
