import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff0ECB81),
    backgroundColor: const Color(0xffF5F7F9),
    cardColor: const Color(0xffF2F3F4),
    textTheme: TextTheme(
      // 화면 제목
      titleLarge: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.w600),
      // 위젯 제목
      titleMedium: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
      // 포트폴리오 이름
      titleSmall: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );

  // 다크 모드도 같은 방식으로 생성 가능
}