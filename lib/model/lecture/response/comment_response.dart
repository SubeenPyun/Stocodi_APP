import 'package:json_annotation/json_annotation.dart';

part 'comment_response.g.dart';

@JsonSerializable()
class CommentResponse {
  final int comment_id;
  final int member_id;
  final int lecture_id;
  final String created_at;
  final String author;
  final String content;

  CommentResponse({
    required this.comment_id,
    required this.member_id,
    required this.lecture_id,
    required this.created_at,
    required this.author,
    required this.content
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}
