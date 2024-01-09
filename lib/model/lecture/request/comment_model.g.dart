// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequest _$CommentRequestFromJson(Map<String, dynamic> json) =>
    CommentRequest(
      lecture_id: json['lecture_id'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CommentRequestToJson(CommentRequest instance) =>
    <String, dynamic>{
      'lecture_id': instance.lecture_id,
      'content': instance.content,
    };
