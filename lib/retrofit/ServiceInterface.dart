import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stocodi_app/retrofit/httpdto/request/auth/members_model.dart';
import 'HttpDTO/request/auth/login_model.dart';
import 'HttpResult.dart';

class ApiService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();
  final PrintHttpResult _httpResult = PrintHttpResult(); // MyHttpResult 인스턴스 생성

  ApiService() {
    //dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1';
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }


  /*Future<Response> stockSell(StockRequest data) async{
    try{
      setToken('access_token');
      final response = await dio.post('/transactions/sells', data: data.toJson());
      return response;
    }catch (e){
      throw Exception('Failed to sellStock: $e');
    }
  }*/


  Future<Response> login(LoginRequest data) async {
    try {
      final response = await dio.post('/auth/login', data: data.toJson());
      final responseData = response.data['response'];
      final accessToken = responseData['access_token'];
      final refreshToken = responseData['refresh_token'];
      await storage.write(key: 'access_token', value: accessToken);
      await storage.write(key: 'refresh_token', value: refreshToken);
      _httpResult.success(response.data["response"], '로그인');
      return response;
    } catch (e) {
      _httpResult.fail(e, '로그인',loginStatusWithTask);
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
      _httpResult.success(response, '닉네임 중복 체크');
      return response;
    }catch(e){
      _httpResult.fail(e,'닉네임 중복 체크',nickNameCheck);
      throw Exception('Failed to check ninickname exists: $e');
    }
  }


  Future<Response> signUp(MembersRequest data) async {
    try {
      final response = await dio.post('/auth/members', data: data.toJson());
      _httpResult.success(response, '회원 가입');
      return response;
    } catch (e) {
      _httpResult.fail(e,'회원가입');
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