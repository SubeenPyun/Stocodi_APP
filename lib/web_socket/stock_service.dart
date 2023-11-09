import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StockService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();

  StockService() {
    dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response> checkSocketConnection() async {
    try {
      final response = await dio.get('/socket');
      return response;
    } catch (e) {
      throw Exception('Failed to check socket connection: $e');
    }
  }

  // Future<Response> logOut() async{
  //   try{
  //     setToken('refresh_token');
  //     final response = await dio.get('/auth/logout');
  //     return response;
  //   }catch(e){
  //     throw Exception('Failed to  logout: $e');
  //   }
  // }
  //
  // Future<Response> nickNameExist(String nickname) async{
  //   try{
  //     final response = await dio.get('/auth/nicknames?nickname=$nickname');
  //     return response;
  //   }catch(e){
  //     throw Exception('Failed to check ninickname exists: $e');
  //   }
  // }
  //
  //
  // Future<Response> signUp(Register data) async {
  //   try {
  //     final response = await dio.post('/auth/members', data: data.toJson());
  //     return response;
  //   } catch (e) {
  //     throw Exception('Failed to signup: $e');
  //   }
  // }
}
