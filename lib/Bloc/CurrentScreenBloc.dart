import 'dart:async';

import 'package:i_supply_task/Bloc/States.dart';

class CurrentScreenBloc {
  final _currentScreenController = StreamController<int>();
  int currentScreenIndex = 0;

  Stream<int> get currentScreenStream => _currentScreenController.stream;

  void changeIndex(int index) {
    currentScreenIndex = index;
    _currentScreenController.add(index);
  }

  // Dispose the StreamController when it's no longer needed
  void dispose() {
    _currentScreenController.close();
  }
}

final currentScreenBloc =
    CurrentScreenBloc(); // Create a single instance, to use it later
