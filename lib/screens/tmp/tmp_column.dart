import 'package:flutter/material.dart';

class TmpColumn extends StatelessWidget {
  const TmpColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/axe_fix.png', // 이미지 경로를 적절히 수정
              width: 120, // 이미지의 폭 조절
              height: 120, // 이미지의 높이 조절
            ),
            SizedBox(height: 16),
            Text(
              '현재 서비스 준비 중입니다',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
