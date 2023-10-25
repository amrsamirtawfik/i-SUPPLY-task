import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF4D6CAD), // Background color
      title: Row(
        children: [
          Image.asset('assets/images/isupply_logo_light.png', width: 100, height: 100),
        ],
      ),
      actions: [
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.notifications), // Notification icon
              if (hasUnreadNotifications) // Conditionally show the badge
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Center(
                      child: Text(
                        '2', // Number of unread notifications
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          onPressed: () {
            // Handle notification icon tap
          },
        ),
      ],
    );
  }

  // Replace this with your notification logic
  bool get hasUnreadNotifications => true; // You can determine if there are unread notifications.
}
