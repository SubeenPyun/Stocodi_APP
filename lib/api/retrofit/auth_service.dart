import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/auth/request/login_model.dart';
import '../../model/auth/request/members_model.dart';
import '../../model/lecture/request/comment_model.dart';
import '../../model/portfolio/request/accounts_model.dart';
import 'http_result.dart';

class ApiService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();
  final PrintHttpResult _httpResult = PrintHttpResult(); // MyHttpResult 인스턴스 생성

  ApiService() {
    //dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1';

    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
  }

  //회원 정보 관련
  Future<Response> signUp(MembersRequest data) async {
    try {
      setHeader();
      final response = await dio.post('/auth/members', data: data.toJson());
      _httpResult.success(response, '회원 가입');
      return response;
    } catch (e) {
      _httpResult.fail(e, '회원가입');
      throw Exception('Failed to signup: $e');
    }
  }

  Future<Response> nickNameExist(String nickname) async {
    try {
      setHeader();
      final response = await dio.get('/auth/nicknames?nickname=$nickname');
      _httpResult.success(response, '닉네임 중복 체크');
      return response;
    } catch (e) {
      _httpResult.fail(e, '닉네임 중복 체크', nickNameStatusCheck);
      throw Exception('Failed to check ninickname exists: $e');
    }
  }

  Future<Response> emailExist(String email) async {
    try {
      setHeader();
      final response = await dio.get('/auth/email?email=$email');
      _httpResult.success(response, '이메일 중복 체크');
      return response;
    } catch (e) {
      _httpResult.fail(e, '이메일 중복 체크', emailStatusCheck);
      throw Exception('Failed to check email exists: $e');
    }
  }

  Future<Response> login(LoginRequest data) async {
    try {
      setHeader();
      final response = await dio.post('/auth/login', data: data.toJson());
      writeToken(response);
      await setCookie();
      _httpResult.success(response.data["response"], '로그인');
      return response;
    } catch (e) {
      _httpResult.fail(e, '로그인', loginStatusCheck);
      throw Exception('Failed to login: $e');
    }
  }

  Future<Response> accountInfo() async {
    try {
      await setToken('access_token');
      final response = await dio.get('/members');
      _httpResult.success(response.data["response"], '계정 정보 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '계정 정보 조회', accountInfoStatusCheck);
      throw Exception('Failed to get accountInfo: $e');
    }
  }

  Future<Response> logOut() async {
    try {
      await setToken('refresh_token');
      final response = await dio.get('/auth/logout');
      _httpResult.success(response, '로그 아웃');
      return response;
    } catch (e) {
      _httpResult.fail(e, '로그 아웃');
      throw Exception('Failed to  logout: $e');
    }
  }

  Future<Response> newToken() async {
    try {
      setHeader();

      await setCookie();
      final response = await dio.post('/auth/reissue-token');

      await writeToken(response);
      await setCookie();
      _httpResult.success(response.data["response"], '토큰 갱신');
      return response;
    } catch (e) {
      _httpResult.fail(e, '토큰 갱신', newTokenStatusCheck);
      throw Exception('Failed to login: $e');
    }
  }

  void setHeader() {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<void> setToken(String token) async {
    final accessToken = await getToken(token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
  }

  Future<String?> getToken(String token) async {
    return await storage.read(key: token);
  }

  Future<void> setCookie() async {
    var accessTokens = await storage.read(key: 'access_token');
    var refreshTokens = await storage.read(key: 'refresh_token');
    var accessCookie = Cookie('member_access_token', accessTokens!);
    var refreshCookie = Cookie('member_refresh_token', refreshTokens!);
    // Interceptor를 사용하여 쿠키를 요청 헤더에 추가
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Cookie'] =
            "${accessCookie.toString()}; ${refreshCookie.toString()}";
        return handler.next(options);
      },
    ));
  }

  Future<void> writeToken(dynamic response) async {
    final responseData = response.data['response'];
    final accessToken = responseData['access_token'];
    final refreshToken = responseData['refresh_token'];
    await storage.write(key: 'access_token', value: accessToken);
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  //////////////////////////////////////////////////////////////////////
  //강의
  Future<Response> writeComment(CommentRequest comment) async {
    try {
      await setToken('access_token');
      final response = await dio.post('/comments', data: comment.toJson());
      _httpResult.success(response, '댓글 작성');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 작성');
      throw Exception('Failed to write comment: $e');
    }
  }

  Future<Response> deleteComment(int lectureId) async {
    try {
      final response = await dio.delete('/lectures/$lectureId');
      _httpResult.success(response, '댓글 삭제');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 삭제');
      throw Exception('Failed to delete comment: $e');
    }
  }


  /////////////////////////////////////////////////////////////////////
  Future<Response> makePortfolio(PortfolioRequest data) async {
    try {
      await setToken('access_token');
      final response = await dio.post('/accounts', data: data.toJson());
      _httpResult.success(response.data["response"], '포트폴리오 생성');
      return response;
    } catch (e) {
      _httpResult.fail(e, '포트폴리오 생성', makePortfolioStatusCheck);
      throw Exception('Failed to make portfolio: $e');
    }
  }

  Future<Response> getPortfolio() async {
    try {
      await setToken('access_token');
      final response = await dio.get('/portfolios');
      _httpResult.success(response.data["response"], '포트폴리오 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '포트폴리오 조회', getPortfolioStatusCheck);
      throw Exception('Failed to get portfolio: $e');
    }
  }
}
