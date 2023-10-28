import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color backgroundColor;

  InfoChip({super.key,
    required this.label,
    required this.iconData,
    this.backgroundColor = Colors.blue, // You can customize the background color
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      label: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white, // Customize the icon color
          ),
          const SizedBox(width: 4), // Adjust spacing as needed
          Text(
            label,
            style: const TextStyle(
              color: Colors.white, // Customize the label text color
            ),
          ),
        ],
      ),
    );
  }
}
