import 'package:json_annotation/json_annotation.dart';
part 'watching_lecture_model.g.dart';

@JsonSerializable()
class WatchingLectureRequest {
  final int lecture_id;
  final String time;

  WatchingLectureRequest({
    required this.lecture_id,
    required this.time,
  });

  Map<String, dynamic> toJson() => _$WatchingLectureRequestToJson(this);
  Map<String, dynamic> toJson2() => _$WatchingLectureRequestToJson2(this);

  factory WatchingLectureRequest.fromJson(Map<String, dynamic> json) {
    return _$WatchingLectureRequestFromJson(json);
  }
}
