import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF0ECB81),
        canvasColor: const Color(0xFFE3FFE7),
        unselectedWidgetColor: const Color(0xFF999999),
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Pretendard Variable',
              fontSize: 16.0,
              fontWeight: FontWeight.w600
          ),
          displayMedium: TextStyle(
            fontFamily: 'Pretendard Variable',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: TextStyle(
              fontFamily: 'Pretendard Variable',
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
        ),
    );
  }
}


