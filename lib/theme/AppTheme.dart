import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF0ECB81),
        canvasColor: const Color(0xFFE3FFE7),
        unselectedWidgetColor: const Color(0xFF999999),
        textTheme: const TextTheme(
          displayMedium: TextStyle(color: Colors.black, fontSize: 28),
          displaySmall: TextStyle(color: Color(0xFFF5F7F9), fontSize: 14),
          /*subtitle1: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold),*/
        ));
  }
}
