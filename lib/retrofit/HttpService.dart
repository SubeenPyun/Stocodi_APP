import 'dart:convert';

import 'package:stocodi_app/retrofit/HttpResult.dart';
import 'package:stocodi_app/retrofit/httpdto/request/auth/members_model.dart';
import 'package:stocodi_app/retrofit/httpdto/response/auth/account_model.dart';
import 'HttpDTO/request/auth/login_model.dart';
import 'ServiceInterface.dart';
import 'httpdto/response/auth/login_model.dart';



class AuthenticationManager {
  final ApiService _apiService = ApiService();

  Future<bool> nickNameExist(String nickname) async{
    try {
      final response = await _apiService.nickNameExist(nickname);
      return true;
    } catch (e) {
      print('닉네임 중복 체크 오류: $e');
      return false;
    }
  }

  Future<bool> emailExist(String email) async{
    try {
      final response = await _apiService.emailExist(email);
      return true;
    } catch (e) {
      print('이메일 체크 오류: $e');
      return false;
    }
  }

  Future<bool> signUp(MembersRequest data) async{
    try {
      await _apiService.signUp(data);
      return true;
    } catch (e) {
      print('오류 $e');
      return false;
    }
  }

  Future<LoginResponse?> login(LoginRequest loginData) async {
    try {
      final response = await _apiService.login(loginData);
      LoginResponse loginResponse = LoginResponse.fromJson(response.data['response']);
      return loginResponse;
    } catch (e) {
      return null;
    }
  }

  Future<AccountInfoResponse?> accountInfo() async {
    try {
      final response = await _apiService.accountInfo();
      AccountInfoResponse accountInfoResponse = AccountInfoResponse.fromJson(response.data['response']);
      return accountInfoResponse;
    } catch (e) {
      return null;
    }
  }

  Future<bool> logOut() async{
    try {
      final response = await _apiService.logOut();
      return true;
    } catch (e) {
      print('로그 아웃 오류: $e');
      return false;
    }
  }




}
