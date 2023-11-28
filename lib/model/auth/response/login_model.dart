import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final int member_id;
  final String member_nickname;
  final String access_token;
  final String refresh_token;

  LoginResponse(
      {required this.member_id,
      required this.member_nickname,
      required this.access_token,
      required this.refresh_token});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }
}
