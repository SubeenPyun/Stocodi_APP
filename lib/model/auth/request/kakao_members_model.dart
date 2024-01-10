import 'package:json_annotation/json_annotation.dart';
part 'kakao_members_model.g.dart';

//카카오 회원가입 하고 싶을 때 보내기
@JsonSerializable()
class KakaoMembersRequest {
  final String email;
  final String name;
  final String nickname;
  final String gender;
  final List<String> interest_categories;
  final String birth_date;

  KakaoMembersRequest({
    required this.email,
    required this.name,
    required this.nickname,
    required this.gender,
    required this.interest_categories,
    required this.birth_date,
  });

  Map<String, dynamic> toJson() => _$KakaoMembersRequestToJson(this);

  factory KakaoMembersRequest.fromJson(Map<String, dynamic> json) {
    return _$KakaoMembersRequestFromJson(json);
  }
}
