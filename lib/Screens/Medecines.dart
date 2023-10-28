import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_supply_task/Bloc/CartBloc.dart';
import 'package:i_supply_task/Bloc/States.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomDropDown.dart';
import 'package:i_supply_task/ReUsableWidgets/CustomModal.dart';
import 'package:i_supply_task/ReUsableWidgets/ProductCard.dart';
import 'package:i_supply_task/MockData/products.dart';
import 'package:i_supply_task/Screens/Cart.dart';

class MedecinesScreen extends StatefulWidget {
  @override
  _MedecinesScreenState createState() => _MedecinesScreenState();
}

class _MedecinesScreenState extends State<MedecinesScreen> {
  String selectedCategory = 'All categories';
  List<String> categories = [
    'All categories',
    ...productsMockData.keys.toList()
  ];
  late double maxRange;
  late double priceRange;

  TextEditingController priceRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Calculate the maxRange from your product data.
    maxRange =
        1070; //max price of the products, this can be calcualted and get from the backend or programtically at the front end by a loop

    // Set the initial priceRange to the calculated maxRange.
    priceRange = maxRange;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, top: 15, bottom: 15, right: 50),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomDropDown(
                          value: selectedCategory,
                          items: categories,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue ?? 'All categories';
                            });
                          })),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: priceRangeController,
                      keyboardType: TextInputType.number,
                      onChanged: (newValue) {
                        setState(() {
                          final enteredPrice =
                              double.tryParse(newValue) ?? priceRange;
                          if (enteredPrice > maxRange) {
                            priceRangeController.text = maxRange.toString();
                            priceRange = maxRange;
                          } else {
                            priceRange = enteredPrice;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter value between 1 - $maxRange',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Slider(
                      value: priceRange,
                      min: 1,
                      max: maxRange,
                      divisions: 200,
                      onChanged: (double newValue) {
                        setState(() {
                          priceRange = newValue;
                          priceRangeController.text = newValue.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: ListView.builder(
                  itemCount: selectedCategory == 'All categories'
                      ? productsMockData.length
                      : 1,
                  itemBuilder: (context, index) {
                    final category = selectedCategory == 'All categories'
                        ? productsMockData.keys.elementAt(index)
                        : selectedCategory;
                    final products = productsMockData[category]!;

                    final filteredProducts = products
                        .where((product) => product.price <= priceRange)
                        .toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: filteredProducts.map((product) {
                            return Padding(
                              padding: const EdgeInsets.all(25),
                              child: ProductCard(
                                imageUrl: product.imageUrl,
                                name: product.name,
                                price: product.price,
                                onAddToCart: () {
                                  int foundIndex = CartBloc.get(context)
                                      .productInCart(product.name);
                                  int capturedQuantity = foundIndex == -1
                                      ? 1
                                      : int.parse(CartBloc.get(context)
                                          .cartList[foundIndex]
                                          .quantity);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomModal(
                                        imageUrl: product.imageUrl,
                                        name: product.name,
                                        price: product.price,
                                        onQuantityChanged: (quantity) {
                                          // Handle quantity change
                                          capturedQuantity = quantity;
                                        },
                                        onAddToCartPressed: () {
                                          // Handle adding to cart

                                          if (foundIndex == -1) {
                                            //product isn't in cart

                                            CartObject cartObject = CartObject(
                                                productName: product.name,
                                                productPrice:
                                                    product.price.toString(),
                                                imageUrl: product.imageUrl,
                                                quantity: capturedQuantity
                                                    .toString());

                                            CartBloc.get(context)
                                                .addProductToCart(cartObject);
                                          } else {
                                            CartBloc.get(context)
                                                .changeQuantity(
                                                    foundIndex,
                                                    capturedQuantity
                                                        .toString());
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
