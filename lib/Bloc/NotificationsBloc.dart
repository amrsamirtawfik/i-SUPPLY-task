import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class NotificationsBloc extends Cubit<NotificationState> {
  NotificationsBloc() : super(NotificationState());

  static NotificationsBloc get(context) => BlocProvider.of(context);

  final List<Map<String, String>> notificationsList = [];
  int unRead = 0;

  void addNotification(Map<String, String> n) {
    notificationsList.add(n);
    unRead++;

    emit(NotificationState());
  }

  void resetUnRead() {
    unRead = 0;
    emit(NotificationState());
  }
}
