import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  CustomDropDown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: items.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      underline: Container(),
      borderRadius: BorderRadius.circular(15),
      elevation: 4,
      hint: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
