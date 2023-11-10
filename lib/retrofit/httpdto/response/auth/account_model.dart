import 'package:json_annotation/json_annotation.dart';
part 'account_model.g.dart';

@JsonSerializable()
class AccountInfoResponse {
  final int id;
  final String email;
  final String password;
  final String name;
  final String nickname;
  final String birth_date;
  final String gender;
  final List<String> interest_categories;
  final String role;

  AccountInfoResponse({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
    required this.birth_date,
    required this.gender,
    required this.interest_categories,
    required this.role
  });

  Map<String, dynamic> toJson() => _$AccountInfoResponseToJson(this);

  factory AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$AccountInfoResponseFromJson(json);
  }
}
