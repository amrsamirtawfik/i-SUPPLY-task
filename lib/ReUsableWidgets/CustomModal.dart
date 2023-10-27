import 'package:flutter/material.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';

class CustomModal extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double price;
  final Function(int) onQuantityChanged;
  final Function() onAddToCartPressed;

  CustomModal({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onQuantityChanged,
    required this.onAddToCartPressed,
  });

  @override
  _CustomModalState createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(widget.imageUrl),
          Text(widget.name, style: const TextStyle(fontSize: 20)),
          Text(
            'Price: \$${widget.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                      widget.onQuantityChanged(quantity);
                    });

                  }
                },
              ),
              Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                    widget.onQuantityChanged(quantity);
                  });

                },
              ),
            ],
          ),
          CustomButton(
            label: 'Add to cart',
            onPressed: () {
              widget.onAddToCartPressed();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
