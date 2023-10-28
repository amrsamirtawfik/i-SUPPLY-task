import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class CurrentScreenBloc extends Cubit<CurrentScreenState> {
  CurrentScreenBloc() : super(CurrentScreenState());

  static CurrentScreenBloc get(context) => BlocProvider.of(context);
  int currentScreenIndex = 0;

  void changeIndex(int index) {
    currentScreenIndex = index;
    emit(CurrentScreenState());
  }

  void navToTrackYourOrder(Map<String, dynamic> order) {
    currentScreenIndex = 2;
    emit(TrackYourOrderScreenState(order: order));
  }
}
