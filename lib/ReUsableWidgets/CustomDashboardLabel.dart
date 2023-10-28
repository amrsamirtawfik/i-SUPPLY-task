import 'package:flutter/material.dart';

class CustomDashboardLabel extends StatelessWidget {
  final Color backgroundColor;
  final String headerText;
  final IconData iconData;
  final String dataText;

  const CustomDashboardLabel({
    super.key,
    required this.backgroundColor,
    required this.headerText,
    required this.iconData,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 110,
      child: Card(
        elevation: 4, // Add a shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                color: backgroundColor, // Dynamic background color
                height: 8.0, // A narrow rectangle on the top
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            headerText, // Dynamic header text
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            dataText, // Dynamic data text
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Icon(iconData,color: backgroundColor,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
