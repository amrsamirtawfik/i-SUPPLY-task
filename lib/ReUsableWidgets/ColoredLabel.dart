import 'package:flutter/material.dart';

class ColoredLabel extends StatelessWidget {
  final String text;
  late Color backgroundColor;

  ColoredLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    if (text == 'Approved') {
      backgroundColor = Colors.green;
    }
    else if(text=='Rejected'){
      backgroundColor=Colors.red;
    }
    else{
      backgroundColor=Colors.grey; //Pending
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
