import 'package:flutter/material.dart';
import 'course_data.dart';

List<String> images = List.generate(5, (index) => 'assets/kakao.jpg');

final unselected = Container(
  width: 6,
  height: 6,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(3),
    color: const Color(0xffd9d9d9),
  ),
);

final selected = Container(
  width: 18,
  height: 6,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: const Color(0xff0ecb81),
  ),
);
var excourse = 'bcD3XMG71vw';
var excourse1 ='Vc8_sLTM_G0';
var excourse2 = 'kB3flfOfxzw';
var courseList = [excourse, excourse1, excourse2];