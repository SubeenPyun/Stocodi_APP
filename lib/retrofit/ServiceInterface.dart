import 'dart:convert';

import 'package:dio/dio.dart';
import 'HttpDTO.dart';

class ApiService {
  final Dio dio = Dio(); // Dio 인스턴스 생성

  ApiService() {
    dio.options.baseUrl = 'http://49.50.175.59:8080/api/v1'; // API 기본 URL로 변경
    dio.options.connectTimeout = 5000; // 연결 시간 초과: 5초
    dio.options.receiveTimeout = 3000; // 응답 시간 초과: 3초
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('/users/login', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Response> nickNameExist(String nickname) async{
    try{
      final response = await dio.get('/users/nickname/exists?nickname=$nickname');
      return response;
    }catch(e){
      throw Exception('Failed to check ninickname exists: $e');
    }
  }

  Future<Response> signUp(signUpRequest data) async {
    try {
      final response = await dio.post('/members/register', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to signup: $e');
    }
  }
}
