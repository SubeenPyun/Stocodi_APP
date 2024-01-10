import 'package:stocodi_app/model/auth/request/kakao_auth_model.dart';
import 'package:stocodi_app/model/auth/request/kakao_members_model.dart';

import '../../model/auth/request/login_model.dart';
import '../../model/auth/request/members_model.dart';
import '../../model/auth/response/account_model.dart';
import '../../model/auth/response/login_model.dart';
import '../../model/portfolio/request/accounts_model.dart';
import '../../model/portfolio/response/portfolio_response.dart';
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
    //print(token);
    return token;
  }

  Future<bool> nickNameExist(String nickname) async {
    try {
      final response = await _apiService.nickNameExist(nickname);
      return true;
    } catch (e) {
      //print('닉네임 중복 체크 오류: $e');
      return false;
    }
  }

  Future<bool> emailExist(String email) async {
    try {
      final response = await _apiService.emailExist(email);
      return true;
    } catch (e) {
      //print('이메일 체크 오류: $e');
      return false;
    }
  }

  Future<bool> signUp(MembersRequest data) async {
    try {
      await _apiService.signUp(data);
      return true;
    } catch (e) {
      //print('오류 $e');
      return false;
    }
  }

  Future<bool> kakaoSignUp(KakaoMembersRequest data) async {
    try {
      await _apiService.kakaoSignUp(data);
      return true;
    } catch (e) {
      //print('오류 $e');
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

  Future<LoginResponse?> kakaoLogin(KakaoAuthRequest authCode) async {
    try {
      final response = await _apiService.kakaoLogin(authCode);
      LoginResponse loginResponse =
          LoginResponse.fromJson(response.data['response']);
      return loginResponse;
    } catch (e) {
      //print("카카오 로그인 도대체 무슨 문제?? $e");
      return null;
    }
  }

/*
  Future<KakaoLoginResponse?> kakaoLogin(KakaoAuthRequest authCode) async {
    try {
      final response = await _apiService.kakaoLogin(authCode);

      // 여기서 HTTP 상태 코드에 따라 처리할 수 있음
      if (response.statusCode == 200) {
        // 성공 시 특정 작업 수행 -> 로그인 바로 되게 해라
        KakaoLoginResponse kakaoLoginResponse =
            KakaoLoginResponse.fromJson(response.data['response']);
        return kakaoLoginResponse;
      } else if (response.statusCode == 400) {
        //유효하지 않는 이메일 -> 이걸 한 이유는 뭐지?
        //어차피 안 되던데 다시 알아봐야할 듯
      } else if (response.statusCode == 401) {
        //회원가입 필요, Response Body로 이메일이 전달
      }
    } catch (e) {
      return null;
    }
    return null;
  }
*/
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
      //print('토큰 갱신 오류: $e');
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      final response = await _apiService.logOut();
      return true;
    } catch (e) {
      //print('로그 아웃 오류: $e');
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
      //print('계좌 생성 오류: $e');
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
      //print('포트폴리오 조회 오류: $e');
      return null;
    }
  }
}
