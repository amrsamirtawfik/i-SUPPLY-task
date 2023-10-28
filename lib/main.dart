import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/NotificationsBloc.dart';
import 'package:i_supply_task/Bloc/PastOrders.dart';
import 'package:i_supply_task/Screens/LoginScreen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(

      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      minimumSize: Size(800, 1000));

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CartBloc>(create: (context) => CartBloc()),
      BlocProvider<PastOrdersBloc>(create: (context) => PastOrdersBloc()),
      BlocProvider<CurrentScreenBloc>(create: (context) => CurrentScreenBloc()),
      BlocProvider<NotificationsBloc>(create: (context) => NotificationsBloc()),
    ],
    child: MaterialApp(
      home: LoginScreen(),
    ),
  ));
}
