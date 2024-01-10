import 'package:json_annotation/json_annotation.dart';
part 'kakao_auth_model.g.dart';

//카카오 로그인 시도할 때 보내는 것
@JsonSerializable()
class KakaoAuthRequest {
  final String authCode;

  KakaoAuthRequest({
    required this.authCode,
  });

  Map<String, dynamic> toJson() => _$KakaoAuthRequestToJson(this);

  factory KakaoAuthRequest.fromJson(Map<String, dynamic> json) {
    return _$KakaoAuthRequestFromJson(json);
  }
}
