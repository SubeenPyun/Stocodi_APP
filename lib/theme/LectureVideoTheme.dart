import 'package:flutter/material.dart';

class LectureVideoTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Pretendard Variable',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.45,
            color: Color(0xff191919),
          ),
          displayMedium: TextStyle(
            fontFamily: 'Pretendard Variable',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.35,
            color: Color(0xff191919),
          ),
          displaySmall: TextStyle(
            fontFamily: 'Pretendard Variable',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.3,
            color: Color(0xff767676),
          ),
          labelSmall: TextStyle(
            fontFamily: 'Pretendard Variable',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.325,
            color: Color(0xff9aa5af),
          ),
        )
    );
  }
}


