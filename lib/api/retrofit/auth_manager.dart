import 'package:dio/dio.dart';

import '../../model/auth/request/login_model.dart';
import '../../model/auth/request/members_model.dart';
import '../../model/auth/response/account_model.dart';
import '../../model/auth/response/login_model.dart';
import '../../model/lecture/request/comment_model.dart';
import '../../model/portfolio/request/accounts_model.dart';
import '../../model/portfolio/response/portfolio_response.dart';
import '../../model/lecture/response/lecture_response.dart';
import 'auth_service.dart';

class AuthenticationManager {
  final ApiService _apiService = ApiService();
  static final AuthenticationManager _instance =
      AuthenticationManager._internal();

  factory AuthenticationManager() {
    return _instance;
  }

  AuthenticationManager._internal();

  Future<String?> getToken(String msg) async {
    var token = await _apiService.getToken(msg);
    print(token);
    return token;
  }

  Future<bool> nickNameExist(String nickname) async {
    try {
      final response = await _apiService.nickNameExist(nickname);
      return true;
    } catch (e) {
      print('닉네임 중복 체크 오류: $e');
      return false;
    }
  }

  Future<bool> emailExist(String email) async {
    try {
      final response = await _apiService.emailExist(email);
      return true;
    } catch (e) {
      print('이메일 체크 오류: $e');
      return false;
    }
  }

  Future<bool> signUp(MembersRequest data) async {
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
      LoginResponse loginResponse =
          LoginResponse.fromJson(response.data['response']);
      return loginResponse;
    } catch (e) {
      return null;
    }
  }

  Future<AccountInfoResponse?> accountInfo() async {
    try {
      final response = await _apiService.accountInfo();
      AccountInfoResponse accountInfoResponse =
          AccountInfoResponse.fromJson(response.data['response']);
      return accountInfoResponse;
    } catch (e) {
      return null;
    }
  }

  Future<bool> newToken() async {
    try {
      final response = await _apiService.newToken();
      return true;
    } catch (e) {
      print('토큰 갱신 오류: $e');
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      final response = await _apiService.logOut();
      return true;
    } catch (e) {
      print('로그 아웃 오류: $e');
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  //강의

  Future<Response?> writeComment(CommentRequest comment) async {
    try {
      final response = await _apiService.writeComment(comment);
      return response;
    } catch (e) {
      print('댓글 작성 오류: $e');
      return null;
    }
  }

  Future<Response?> deleteComment(int lectureId) async {
    try {
      final response = await _apiService.deleteComment(lectureId);
      return response;
    } catch (e) {
      print('댓글 삭제 오류: $e');
    }
    return null;
  }

  Future<List<LectureResponse>?> getLecture() async {
    try {
      final response = await _apiService.getLecture();
      List<LectureResponse> lectureResponses =
      (response.data['response'] as List)
          .map((json) => LectureResponse.fromJson(json))
          .toList();
      return lectureResponses;
    } catch (e) {
      print('강의 조회 오류: $e');
      return null;
    }
  }

  //////////////////////////////////////////////////////////////////////////
  Future<bool> makePortfolio(PortfolioRequest data) async {
    try {
      final response = await _apiService.makePortfolio(data);
      return true;
    } catch (e) {
      print('계좌 생성 오류: $e');
      return false;
    }
  }


  Future<List<PortfoiloResponse>?> getPortfolio() async {
    try {
      final response = await _apiService.getPortfolio();
      List<PortfoiloResponse> portfolioResponses =
          (response.data['response'] as List)
              .map((json) => PortfoiloResponse.fromJson(json))
              .toList();
      return portfolioResponses;
      /*String firstAccountName = portfolioResponses[0].account.account_name;
      print(firstAccountName);*/
    } catch (e) {
      print('포트폴리오 조회 오류: $e');
      return null;
    }
  }
}
