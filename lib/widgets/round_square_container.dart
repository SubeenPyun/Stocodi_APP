import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RoundSquareContainer extends StatelessWidget {
  final double width; // 가로 크기를 설정할 변수
  final double height; // 세로 크기를 설정할 변수
  final Widget child;

  RoundSquareContainer({
    super.key,
    this.width = 200.0,
    this.height = 200.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 15),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // 하얀색 배경
        borderRadius: BorderRadius.circular(25), // 둥근 모서리
      ),
      child: child,
    );
  }
}
