import 'package:flutter/material.dart';

class TransactionTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xff191919),
    cardColor: const Color(0xffF2F3F4),
    unselectedWidgetColor: const Color(0xFF999999),
    textTheme: const TextTheme(
      // selected tabbar
      displayLarge: TextStyle(
        fontSize: 18,
        color: Color(0xff191919),
        fontWeight: FontWeight.w700,
        fontFamily: 'Pretendard Variable',
      ),
      //unselected tabbar
      displayMedium: TextStyle(
        fontSize: 18,
        color: Color(0xff999999),
        fontWeight: FontWeight.w500,
        fontFamily: 'Pretendard Variable',
      ),
      // 종목
      titleLarge: TextStyle(
        fontSize: 16,
        color: Color(0xff191919),
        fontWeight: FontWeight.w700,
        fontFamily: 'Pretendard Variable',
      ),
      // 회색 작은 글씨, 500
      titleMedium: TextStyle(
        fontSize: 14,
        color: Color(0xff575E6B),
        fontWeight: FontWeight.w500,
        fontFamily: 'Pretendard Variable',
      ),
      // 회색 작은 글씨, 400
      titleSmall: TextStyle(
        fontSize: 18,
        color: Color(0xff575E6B),
        fontWeight: FontWeight.w400,
        fontFamily: 'Pretendard Variable',
      ),
      //몇 주 매수
      labelLarge: TextStyle(
        fontSize: 16,
        color: Color(0xff191919),
        fontWeight: FontWeight.w500,
        fontFamily: 'Pretendard Variable',
      ),
      //매수 가격
      labelMedium: TextStyle(
        fontSize: 14,
        color: Color(0xffF6465D),
        fontWeight: FontWeight.w600,
        fontFamily: 'Pretendard Variable',
      ),
      //매도 가격
      labelSmall: TextStyle(
        fontSize: 14,
        color: Color(0xff4496f7),
        fontWeight: FontWeight.w600,
        fontFamily: 'Pretendard Variable',
      ),
    ),
  );

  // 다크 모드도 같은 방식으로 생성 가능
}
