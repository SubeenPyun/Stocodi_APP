import 'package:flutter/material.dart';

ElevatedButton buildOptionButton(String text, Function() onPressed, bool isSelected) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      primary: isSelected ? Colors.black : Colors.grey, // 선택 여부에 따라 색상 변경
      onPrimary: Colors.white, // 버튼 텍스트 색상
    ),
    child: Text(text),
  );
}

ElevatedButton buysellBtn(String text, Function() onPressed, Color primaryColor, Color onPrimaryColor, BuildContext  context) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      primary: primaryColor, // Background color
      onPrimary: onPrimaryColor, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      minimumSize: Size(MediaQuery.of(context).size.width*2 / 5, 50), // Set the button width to half of the screen width
    ),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Pretendard Variable',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}