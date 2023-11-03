import 'package:flutter/material.dart';

class GreenLongBtn extends StatelessWidget {
  final String text;
  final double height;
  const GreenLongBtn({
    required this.text,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF0ECB81),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Pretendard Variable',
            ),
          ),
        ],
      ),
    );
  }
}
