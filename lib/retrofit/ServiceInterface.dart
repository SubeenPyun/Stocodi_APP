import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'HttpDTO/Login.dart';
import 'HttpDTO/Register.dart';

class ApiService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();

  ApiService() {
    // dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1'; // API 기본 URL로 변경
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> login(Login data) async {
    try {
      final response = await dio.post('/auth/login', data: data.toJson());
      // 토큰 저장
      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<Response> logOut() async{
    try{
      setToken('refresh_token');
      final response = await dio.get('/auth/logout');
      return response;
    }catch(e){
      throw Exception('Failed to  logout: $e');
    }
  }
  
  Future<Response> nickNameExist(String nickname) async{
    try{
      final response = await dio.get('/auth/nicknames?nickname=$nickname');
      return response;
    }catch(e){
      throw Exception('Failed to check ninickname exists: $e');
    }
  }


  Future<Response> signUp(Register data) async {
    try {
      final response = await dio.post('/auth/members', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to signup: $e');
    }
  }


  void setToken(String token) async {
    final accessToken = await getToken(token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
  }

  // 저장된 토큰을 가져오는 함수
  Future<String?> getToken(String token) async {
    return await storage.read(key: token);
  }

  /*// API 요청을 보내는 함수
  Future<void> sendApiRequest() async {
    final token = await getToken();
    if (token != null) {
      final url = 'https://example.com/api/resource';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token', // 토큰을 헤더에 추가
        },
      );

      if (response.statusCode == 200) {
        // 성공적인 응답 처리
        print('API 응답: ${response.body}');
      } else {
        // 에러 처리
        print('API 요청 실패: ${response.statusCode}');
      }
    }
  }*/
}
