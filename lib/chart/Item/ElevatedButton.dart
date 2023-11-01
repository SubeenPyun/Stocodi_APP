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
