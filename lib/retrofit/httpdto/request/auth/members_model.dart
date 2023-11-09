import 'package:json_annotation/json_annotation.dart';
part 'members_model.g.dart';

@JsonSerializable()
class MembersRequest {
  final String email;
  final String password;
  final String name;
  final String nickname;
  final String gender;
  final List<String> interest_categories;
  final String birth_date;

  MembersRequest({
    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
    required this.gender,
    required this.interest_categories,
    required this.birth_date,
  });

  factory MembersRequest.fromJson(Map<String, dynamic> json) {
    return _$MembersRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MembersRequestToJson(this);
}
