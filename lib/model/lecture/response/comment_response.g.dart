// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      comment_id: json['comment_id'] as int,
      member_id: json['member_id'] as int,
      lecture_id: json['lecture_id'] as int,
      created_at: json['created_at'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'comment_id': instance.comment_id,
      'member_id': instance.member_id,
      'lecture_id': instance.lecture_id,
      'created_at': instance.created_at,
      'author': instance.author,
      'content': instance.content,
    };
