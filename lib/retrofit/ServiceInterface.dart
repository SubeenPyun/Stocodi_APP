import 'package:dio/dio.dart';
import 'HttpDTO/Login.dart';
import 'HttpDTO/Register.dart';

class ApiService {
  final Dio dio = Dio(); // Dio 인스턴스 생성

  ApiService() {
    dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.connectTimeout = 5000 as Duration?; // 연결 시간 초과: 5초
    dio.options.receiveTimeout = 3000 as Duration?; // 응답 시간 초과: 3초
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> login(Login data) async {
    try {
      final response = await dio.post('/auth/sign-in', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Response> nickNameExist(String nickname) async{
    try{
      final response = await dio.get('/auth/check-nickname?nickname=$nickname');
      return response;
    }catch(e){
      throw Exception('Failed to check ninickname exists: $e');
    }
  }

  Future<Response> signUp(Register data) async {
    try {
      final response = await dio.post('/auth/sign-up', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to signup: $e');
    }
  }
}
