import 'package:flutter/material.dart';

class TmpColumn extends StatelessWidget {
  const TmpColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Center(
          child: Text(
            "현재 서비스 준비중입니다",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
