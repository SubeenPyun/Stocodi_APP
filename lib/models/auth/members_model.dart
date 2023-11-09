import 'package:json_annotation/json_annotation.dart';
part 'members_model.g.dart';

@JsonSerializable()
class Members {
  final String email;
  final String password;
  final String name;
  final String nickname;
  final String gender;
  final List<String> interestCategories;
  final DateTime birthDate;

  Members({
    required this.email,
    required this.password,
    required this.name,
    required this.nickname,
    required this.gender,
    required this.interestCategories,
    required this.birthDate,
  });

  factory Members.fromJson(Map<String, dynamic> json) {
    return _$MembersFromJson(json);
  }

  static DateTime _dateTimeFromJson(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }
}
