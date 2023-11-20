import 'package:flutter/material.dart';

class ClassRoomLectureTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Pretendard Variable',
          fontSize: 26,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.65,
          color: Color(0xff191919),
        ),
      ),
    );
  }
}


