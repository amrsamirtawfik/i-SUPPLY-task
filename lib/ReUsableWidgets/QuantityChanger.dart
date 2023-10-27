import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityChanger extends StatefulWidget {
  int quantity;
  Function(int) onButtonPressed;

  QuantityChanger(
      {super.key, required this.quantity, required this.onButtonPressed});

  @override
  _QuantityChangerState createState() => _QuantityChangerState();
}

class _QuantityChangerState extends State<QuantityChanger> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (widget.quantity > 1) {
              setState(() {
                widget.quantity--;
                widget.onButtonPressed(widget.quantity);
              });
            }
          },
        ),
        Text(widget.quantity.toString(), style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              widget.quantity++;
              widget.onButtonPressed(widget.quantity);
            });
          },
        ),
      ],
    );
  }
}
