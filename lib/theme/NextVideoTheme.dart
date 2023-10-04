import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Pretendard Variable',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF191919),
        ),
        displayMedium: TextStyle(
          fontFamily: 'Pretendard Variable',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF767676),
        ),
        displaySmall: TextStyle(
          fontFamily: 'Pretendard Variable',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF767676),
        ),
      )
    );
  }
}


