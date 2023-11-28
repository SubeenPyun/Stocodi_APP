import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double borderRadius;
  final Color textColor;

  RoundedBox({
    required this.text,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 10.0,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
