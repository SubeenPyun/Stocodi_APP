import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stocodi_app/model/stockDTO/request/interest_stock.dart';
import 'package:stocodi_app/model/stockDTO/response/stock_rank.dart';

import '../../model/stock/request/change_stock.dart';
import '../../model/stock/request/interest_stock.dart';

class StockService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();

  StockService() {
    // dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1'; // localhost 에뮬레이터 URL
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    dio.options.headers = {
      'Content-Type': 'application/json', // 디폴트 헤더
    };
  }

  // 헤더에 Authorization으로 access_token 값 추가
  Future<void> setAuthorizationHeader() async {
    final accessToken = await storage.read(key: 'access_token');
    if (accessToken != null) {
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  // 소켓 연결 체크
  Future<Response> checkSocketConnection() async {
    await setAuthorizationHeader();
    try {
      final response = await dio.get('/socket');
      return response;
    } catch (e) {
      throw Exception('Failed to check socket connection: $e');
    }
  }

  // 실시간 주식 변경
  Future<Response> changeStock(ChangeStock data) async {
    await setAuthorizationHeader();
    try {
      final response = await dio.post('/socket', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to change real-time stock: $e');
    }
  }

  // 관심 종목 등록
  Future<Response> registerInterestStock(InterestStock data) async {
    await setAuthorizationHeader();
    try {
      final response = await dio.post('/stocks/interest', data: data.toJson());
      return response;
    } catch (e) {
      throw Exception('Failed to register interest stock $e');
    }
  }

  // 관심 종목 실시간 거래량 순위 Best 5
  Future<Response> getBest5InterestStock(String email) async {
    await setAuthorizationHeader();
    try {
      final response = await dio.get('/stocks/interest/volume-rank?email=$email');
      return response;
    } catch (e) {
      throw Exception('Failed to get best5 interest stock: $e');
    }
  }

  // 종목 차트 정보 조회
  Future<Response> getStockChartInfo(String code) async {
    await setAuthorizationHeader();
    try {
      final response = await dio.get('/stocks/info?code=$code');
      return response;
    } catch (e) {
      throw Exception('Failed to get stock chart info: $e');
    }
  }

  // 실시간 거래량 순위 Best 5
  Future<Response> getBest5Stock() async {
    await setAuthorizationHeader();
    try {
      final response = await dio.get('/stocks/volume-rank');
      return response;
    } catch (e) {
      throw Exception('Failed to get best5 stock: $e');
    }
  }

  // 종목 검색
  Future<Response> getStockInfo(String key) async {
    await setAuthorizationHeader();
    try {
      final response = await dio.get('/stocks/search?key=$key');
      return response;
    } catch (e) {
      throw Exception('Failed to get stock info: $e');
    }
  }
}
