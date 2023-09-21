import 'ServiceInterface.dart';
import 'HttpDTO.dart';

class AuthenticationManager {
  final ApiService _apiService = ApiService();

  Future<void> login(String email, String password) async {
    try {
      // 로그인 요청을 위한 데이터를 준비
      final Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      // ApiService의 login 메서드 호출
      final response = await _apiService.login(loginData);

      // 응답 처리
      if (response.statusCode == 200) {
        // 로그인 성공
        final responseData = response.data;
        print('로그인 성공: $responseData');
      } else {
        // 로그인 실패
        print('로그인 실패. 응답 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('로그인 오류: $e');
    }
  }

  Future<void> nickNameExist() async{
    try {
      final response = await _apiService.nickNameExist('예리미양');

      print('waiting');
      // 응답 처리
      if (response.statusCode == 200) {
        //get 성공
        final responseData = response.data;
        print('중복체크 성공: $responseData');
      } else {
        //get 실패
        print('중복체크 실패. 응답 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('중복체크 오류: $e');
    }
  }

  Future<void> signUp(signUpRequest data) async{
    try {
      final response = await _apiService.signUp(data);

      print('waiting');
      // 응답 처리
      if (response.statusCode == 200) {
        //get 성공
        final responseData = response.data;
        print('회원가입 성공: $responseData');
      } else {
        //get 실패
        print('회원가입 실패. 응답 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('회원가입 오류: $e');
    }
  }
}
