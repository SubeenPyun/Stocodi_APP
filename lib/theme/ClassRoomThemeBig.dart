import 'package:flutter/material.dart';

class ClassRoomThemeBig {
  static ThemeData getAppTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF0ECB81),
        canvasColor: const Color(0xFFE3FFE7),
        unselectedWidgetColor: const Color(0xFF999999),
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Pretendard Variable',
              fontSize: 25,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: -0.5,
              color: Color(0xff000000),
            ),
            displayMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: TextStyle(fontSize: 16))
    );
  }
}


