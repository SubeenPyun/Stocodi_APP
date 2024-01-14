// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureResponse _$LectureResponseFromJson(Map<String, dynamic> json) =>
    LectureResponse(
      id: json['id'] as int,
      video_link: json['video_link'] as String,
      thumbnail_name: json['thumbnail_name'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      views: json['views'] as int,
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$LectureResponseToJson(LectureResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'video_link': instance.video_link,
      'thumbnail_name': instance.thumbnail_name,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'views': instance.views,
      'likes': instance.likes,
    };
