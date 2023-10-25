import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;

  final VoidCallback onPressed; // Add this line

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed, // Add this parameter
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the onPressed function
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4D6CAD),
      ),
      child: Text(label),
    );
  }
}
