import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CurrentScreenBloc.dart';
import 'package:i_supply_task/Bloc/NotificationsBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';

class CustomAppBar extends StatelessWidget {
  final List<Map<String, String>> notificationItems;

  CustomAppBar({Key? key, required this.notificationItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF4D6CAD),
      title: Row(
        children: [
          Image.asset('assets/images/isupply_logo_light.png',
              width: 100, height: 100),
        ],
      ),
      actions: [
        BlocConsumer<NotificationsBloc, NotificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return PopupMenuButton(
                onOpened: () {
                  context.read<NotificationsBloc>().resetUnRead();
                },
                itemBuilder: (context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                      child: SizedBox(
                        height: 500,
                        width: 250,
                        child: ListView.builder(
                          itemCount: context
                              .read<NotificationsBloc>()
                              .notificationsList
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                hoverColor: Colors.grey,
                                onTap: () {},
                                leading: const Icon(Icons.add),
                                title: Text(NotificationsBloc.get(context)
                                    .notificationsList[index]["body"]!),
                                subtitle: Text(
                                  NotificationsBloc.get(context)
                                      .notificationsList[index]['time']!,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ];
                },
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    if (NotificationsBloc.get(context).unRead > 0)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Center(
                            child: Text(
                              NotificationsBloc.get(context).unRead.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onSelected: (value) {
                  // Handle the selection if needed
                },
              );
            }),
      ],
    );
  }
}
