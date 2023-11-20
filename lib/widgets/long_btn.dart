import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final double frontboxsize;
  final String imgName;
  final String text;
  final Color borderColor;
  final Color textColor;
  final double height;
  final double imgsize;
  final double betweensize;

  const LongButton({
    super.key,
    required this.frontboxsize,
    required this.imgName,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.height,
    required this.imgsize,
    required this.betweensize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 326,
      height: height,
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
            width: imgsize,
            height: imgsize,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: betweensize,
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
