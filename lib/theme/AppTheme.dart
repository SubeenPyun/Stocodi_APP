import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF0ECB81),
        hintColor: const Color(0xFFF5F7F9),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 30),
          bodyText2: TextStyle(color: Color(0xFFF5F7F9), fontSize: 20),
          /*subtitle1: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold),*/
        )
    );
  }
}


