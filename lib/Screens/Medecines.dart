import 'package:flutter/cupertino.dart';
import 'package:i_supply_task/ReUsableWidgets/ProductCard.dart';

class MedecinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductCard(
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/isupply-task.appspot.com/o/physiogel_ai_calming_relief_cream_50gm_79429_0_6.jpg?alt=media&token=da2df9da-ba78-4a92-90a5-095f0bf84768&_gl=1*mxsnsx*_ga*MTUyMDgyNjI3OC4xNjk4MjE1ODc4*_ga_CW55HF8NVT*MTY5ODIxNTg3OC4xLjEuMTY5ODIxOTczMS4yNi4wLjA.',
        name: 'Physiogel Ai Calming Relief Cream 50gm',
        price: 556.75,
        onAddToCart: () {});
  }
}
