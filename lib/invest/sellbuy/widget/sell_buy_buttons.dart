import 'package:flutter/material.dart';

class SellBuyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // 매수하기 버튼 클릭 시 실행될 코드
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFEDEF), // 버튼 배경 색상
                onPrimary: Color(0xFFF6465D), // 버튼 텍스트 색상
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // 모서리 radius 설정
                ),
                elevation: 0,
              ),
              child: Text('매수하기'),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // 매도하기 버튼 클릭 시 실행될 코드
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE8F2FE), // 버튼 배경 색상
                onPrimary: Color(0xFF4496F7), // 버튼 텍스트 색상
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // 모서리 radius 설정
                ),
                elevation: 0,
              ),
              child: Text('매도하기'),
            ),
          )
        ],
      ),
    );
  }
}
