import 'package:flutter/material.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';
import 'package:i_supply_task/ReUsableWidgets/QuantityChanger.dart';

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
  void initState() {
    super.initState();
    final index = CartBloc.get(context).productInCart(widget.name);

    quantity = index != -1
        ? int.parse(CartBloc.get(context).cartList[index]["quantity"]!)
        : 1;

  }

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
          QuantityChanger(
              quantity: quantity,
              onButtonPressed: (capturedQuantity) {
                quantity = capturedQuantity;
                widget.onQuantityChanged(quantity);
              }),
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
