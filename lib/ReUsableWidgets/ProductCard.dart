import 'package:flutter/material.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomButton.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final Function() onAddToCart;

  ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomButton(label: 'Add to cart', onPressed: onAddToCart)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
