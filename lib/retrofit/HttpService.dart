import 'package:stocodi_app/retrofit/httpdto/request/auth/members_model.dart';
import 'package:stocodi_app/retrofit/httpdto/request/transactions/accounts_model.dart';
import 'package:stocodi_app/retrofit/httpdto/response/auth/account_model.dart';
import 'package:stocodi_app/retrofit/httpdto/request/auth/login_model.dart';
import 'ServiceInterface.dart';
import 'httpdto/response/auth/login_model.dart';
import 'httpdto/response/transactions/portfolios_model.dart';

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

  Future<bool> newToken() async{
    try {
      final response = await _apiService.newToken();
      return true;
    } catch (e) {
      print('토큰 갱신 오류: $e');
      return false;
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

  //주식 구매 판매
  /*Future<bool> stockSell() async{
    try {
      final response = await _apiService.stockSell();
      return true;
    } catch (e) {
      print('주식 판매 오류: $e');
      return false;
    }
  }*/
  Future<bool> makePortfolio(PortfolioRequest data) async {
    try {
      final response = await _apiService.makePortfolio(data);
      return true;
    } catch (e) {
      print('계좌 생성 오류: $e');
      return false;
    }
  }

  Future<List<GetPortfolioResponse>?> getPortfolio() async {
    try {
      final response = await _apiService.getPortfolio();
      List<GetPortfolioResponse> portfolioResponses = (response.data['response'] as List)
          .map((json) => GetPortfolioResponse.fromJson(json))
          .toList();
      return portfolioResponses;
      /*String firstAccountName = portfolioResponses[0].account.account_name;
      print(firstAccountName);*/
    } catch (e) {
      print('계좌 조회 오류: $e');
      return null;
    }
  }
}
