import 'package:json_annotation/json_annotation.dart';
part 'comment_model.g.dart';

@JsonSerializable()
class CommentRequest {
  final int lecture_id;
  final String content;

  CommentRequest({
    required this.lecture_id,
    required this.content,
  });

  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);

  factory CommentRequest.fromJson(Map<String, dynamic> json) {
    return _$CommentRequestFromJson(json);
  }
}
