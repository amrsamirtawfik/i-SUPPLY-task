import 'package:flutter/material.dart';

class ColoredLabel extends StatelessWidget {
  final String text;
  late Color backgroundColor;

  ColoredLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    switch (text) {
      case 'Pending':
        backgroundColor = Colors.black;
        break;
      case 'Approved':
        backgroundColor = Colors.green;
        break;
      case 'Rejected':
        backgroundColor = Colors.red;
        break;
      case 'Ready':
        backgroundColor = Colors.green;
        break;
      case 'Out for delivery':
        backgroundColor = Colors.green;
      case 'Cancelled':
        backgroundColor = Color(0xFFFFE300);
      case 'Delivered':
        backgroundColor = Colors.green;
      default:
        backgroundColor = Colors.grey;
    }
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // You can customize the text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
