import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'Login.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class Login {
  final String email;
  final String password;


  Login(this.email, this.password);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory Login.fromJson(Map<String, dynamic> json) =>
      _$LoginFromJson(json);
}

