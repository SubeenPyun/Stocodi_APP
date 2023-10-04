import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendarHeader extends StatelessWidget {
  final DateTime focusedDay;

  CustomCalendarHeader({required this.focusedDay});

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMMM('ko_KR').format(focusedDay); // 헤더에 표시할 날짜 포맷

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // 헤더 배경색
      ),
      padding: EdgeInsets.all(16.0), // 헤더 여백 설정
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // 이전 달로 이동하는 로직 추가
            },
          ),
          Text(
            headerText,
            style: TextStyle(
              color: Colors.white, // 헤더 텍스트 색상
              fontSize: 20.0, // 헤더 텍스트 크기
              fontWeight: FontWeight.bold, // 헤더 텍스트 두께
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            onPressed: () {
              // 다음 달로 이동하는 로직 추가
            },
          ),
        ],
      ),
    );
  }
}
