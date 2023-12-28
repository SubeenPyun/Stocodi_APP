import 'package:json_annotation/json_annotation.dart';

part 'lecture_response.g.dart';

@JsonSerializable()
class LectureResponse {
  final int id;
  final String videoLink;
  final String title;
  final String description;
  final List<String> tags;
  final int views;
  final int likes;

  LectureResponse({
    required this.id,
    required this.videoLink,
    required this.title,
    required this.description,
    required this.tags,
    required this.views,
    required this.likes,
  });

  factory LectureResponse.fromJson(Map<String, dynamic> json) => _$LectureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LectureResponseToJson(this);
}
