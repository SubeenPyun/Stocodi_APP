import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/auth/request/login_model.dart';
import '../../model/auth/request/members_model.dart';
import '../../model/portfolio/request/accounts_model.dart';
import '../retrofit/http_result.dart';

class ImageService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();
  final PrintHttpResult _httpResult = PrintHttpResult(); // MyHttpResult 인스턴스 생성

  ImageService() {
    //dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1';
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
  }

  void setHeader() {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<void> setToken(String token) async {
    final accessToken = await getToken(token);
    dio.options.headers = {
      'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
      'Authorization': 'Bearer $accessToken'
    };
  }

  Future<String?> getToken(String token) async {
    return await storage.read(key: token);
  }

  Future<Uint8List?> getImage(String thumbNailName) async {
    try {
      await setToken('access_token');
      final response = await dio.get('/storage/images/$thumbNailName',options: Options(responseType: ResponseType.bytes)); // 이미지를 가져올 엔드포인트 URL
      if (response.statusCode == 200) {
        // 이미지 데이터를 Uint8List로 변환해서 반환
        return Uint8List.fromList(response.data);
      } else {
        throw Exception('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get image: $e');
    }
  }
}
