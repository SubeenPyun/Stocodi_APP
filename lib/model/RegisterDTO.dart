import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'RegisterDTO.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class RegisterDTO{
  final String email;
  final String name;
  final String password;
  final String nickname;
  final String birth_date;
  final List<String> interest_categories;
  final List<String> roles;
  final List<String> gender;

  RegisterDTO(
      this.email,
      this.name,
      this.password,
      this.nickname,
      this.birth_date,
      this.interest_categories,
      this.roles,
      this.gender
      );

  // JSON 직렬화를 위한 메서드
  Map<String, dynamic> toJson() => _$RegisterDTOToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory RegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterDTOFromJson(json);

  // Dio를 사용하여 POST 요청을 보내고 응답을 처리하는 메서드
  static Future<void> registerUser(RegisterDTO registerDTO) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        'https://api.example.com/register', // API 엔드포인트 URL을 변경하세요.
        data: registerDTO.toJson(), // RegisterDTO 객체를 JSON으로 직렬화하여 요청 본문에 추가
      );

      if (response.statusCode == 200) {
        // 요청이 성공하면 응답을 역직렬화하여 처리
        final responseData = response.data;
        final registeredUser = RegisterDTO.fromJson(responseData);
        print('User registered successfully: ${registeredUser.name}');
      } else {
        // 요청이 실패한 경우 에러 처리
        print('Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // 네트워크 오류 또는 예외 처리
      print('Error occurred: $e');
    }
  }
}