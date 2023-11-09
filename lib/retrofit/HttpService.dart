import 'dart:convert';

import 'package:stocodi_app/retrofit/HttpResult.dart';
import 'package:stocodi_app/retrofit/httpdto/request/auth/members_model.dart';
import 'HttpDTO/Register.dart';
import 'HttpDTO/request/auth/login_model.dart';
import 'ServiceInterface.dart';
import 'httpdto/response/auth/login_model.dart';

final PrintHttpResult _httpResult = PrintHttpResult(); // MyHttpResult 인스턴스 생성

class AuthenticationManager {
  final ApiService _apiService = ApiService();

  Future<LoginResponse?> login(LoginRequest loginData) async {
    try {
      // ApiService의 login 메서드 호출
      final response = await _apiService.login(loginData);
      print("nn${response.data['response']}");
      LoginResponse loginResponse = LoginResponse.fromJson(response.data['response']);
      _httpResult.PrintResult(response, '로그인');
      return loginResponse;

    } catch (e) {
      print('로그인 오류: $e');
      return null;
    }
  }

  Future<void> logOut() async{
    try {
      final response = await _apiService.logOut();
      _httpResult.PrintResult(response, '로그 아웃');
    } catch (e) {
      print('로그 아웃 오류: $e');
    }
  }

  Future<String> nickNameExist(String nickname) async{
    try {
      final response = await _apiService.nickNameExist(nickname);
      _httpResult.PrintResult(response, '닉네임 중복');
      return '성공';
    } catch (e) {
      print('닉네임 중복 체크 오류: $e');
      return '실패';
    }
  }

  Future<void> signUp(MembersRequest data) async{
    try {
      final response = await _apiService.signUp(data);
      _httpResult.PrintResult(response, '회원 가입');
    } catch (e) {
      print('회원가입 오류: $e');
    }
  }
}
