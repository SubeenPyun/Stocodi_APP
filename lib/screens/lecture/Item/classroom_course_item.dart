import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomCourseItem extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseImage; // 이미지 데이터를 담는 문자열
  final String videoLink;
  final int lectureId;

  const ClassRoomCourseItem({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.videoLink,
    required this.lectureId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.5;
    double cardHeight = cardWidth * 0.8;

    // Base64로 인코딩된 이미지 데이터를 디코딩하여 이미지로 변환
    Uint8List decodedImage = base64Decode(courseImage);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Lecture(courseCardItem: this,),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Container(
          width: cardWidth,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: cardWidth,
                height: cardHeight * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: MemoryImage(decodedImage), // 디코딩한 이미지 데이터를 사용하여 이미지 표시
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(courseTitle, style: textTheme.displayMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(courseDescription, style: textTheme.displaySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}