import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final double frontboxsize;
  final String imgName;
  final String text;
  final Color borderColor;
  final Color textColor;

  const LongButton({
    super.key,
    required this.frontboxsize,
    required this.imgName,
    required this.text,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 326,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: frontboxsize,
          ),
          Image.asset(
            'assets/images/$imgName',
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Pretendard Variable',
            ),
          ),
        ],
      ),
    );
  }
}
