// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_lecture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchingLectureRequest _$WatchingLectureRequestFromJson(
        Map<String, dynamic> json) =>
    WatchingLectureRequest(
      lecture_id: json['lecture_id'] as int,
      time: json['time'] as String,
    );

Map<String, dynamic> _$WatchingLectureRequestToJson(
        WatchingLectureRequest instance) =>
    <String, dynamic>{
      'lecture_id': instance.lecture_id,
      'time': instance.time,
    };

Map<String, dynamic> _$WatchingLectureRequestToJson2(
    WatchingLectureRequest instance) =>
    <String, dynamic>{
      'time': instance.time,
    };
