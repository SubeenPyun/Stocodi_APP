import 'package:json_annotation/json_annotation.dart';
part 'reissue_token_model.g.dart';

@JsonSerializable()
class Reissue_Token {
  final String access_token;
  final String refresh_token;

  Reissue_Token({
    required this.access_token,
    required this.refresh_token,
  });

  factory Reissue_Token.fromJson(Map<String, dynamic> json) {
    return Reissue_Token(
      access_token: json["access_token"] as String,
      refresh_token: json["refresh_token"] as String,
    );
  }
}
