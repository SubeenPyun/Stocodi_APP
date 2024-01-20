import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  final String price;
  final String variant;

  PriceContainer({super.key, required this.price, required this.variant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize;
    Color textColor;

    if (screenWidth < 600) {
      fontSize = 35.0;
      textColor = Colors.blue;
    } else {
      fontSize = 45.0;
      textColor = Colors.black; // Change to your desired color
    }

    return Container(
      width: double.infinity, // Set width to maximum
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-align the text
        children: [
          Text(
            price,
            style: TextStyle(fontSize: fontSize),
          ),
          Text(
            variant,
            style: TextStyle(fontSize: fontSize - 20, color: textColor),
          ),
        ],
      ),
    );
  }
}