import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:stocodi_app/api/retrofit/auth_manager.dart';
import 'package:stocodi_app/api/retrofit/auth_service.dart';
import 'package:stocodi_app/model/auth/kakao/Social_login.dart';
import 'package:stocodi_app/screens/sign_up/signup_deatil.dart';
import 'package:stocodi_app/screens/sign_up/signup_done.dart';

class SocialViewModel {
  final SocialLogin _socialLogin;
  String isLogined = "";
  User? user;
  String authCode = "";

  final authenticationManager = AuthenticationManager();

  final ApiService _apiService = ApiService();
  SocialViewModel(this._socialLogin);

  Future<String> login() async {
    isLogined = await _socialLogin.sociallogin();
    if (isLogined.isNotEmpty) {
      authCode = isLogined;
      print("최최최종");
      //isLogined는 oauth에 들어가기 위한 authCode!
      try {
        //여기서 토큰 받아서 해야할듯!
        //토큰 받아서 회원가입 되어 있던 회원인지, 회원가입해야하는지!
        /*final response = await _apiService.kakaoLogin(isLogined);

        // 여기서 HTTP 상태 코드에 따라 처리할 수 있음
        if (response.statusCode == 200) {
          // 성공 시 특정 작업 수행 -> 로그인 바로 되게 해라
          print("200이 stautsCode입니다.");
          KakaoLoginResponse kakaoLoginResponse =
              KakaoLoginResponse.fromJson(response.data['response']);

          return "1";
          //return kakaoLoginResponse;
        } else if (response.statusCode == 400) {
          //유효하지 않는 이메일 -> 이걸 한 이유는 뭐지?
          print("400이 stautsCode입니다.");
          return "2";
        } else if (response.statusCode == 401) {
          //회원가입 필요, Response Body로 이메일이 전달
          print("401이 stautsCode입니다.");
          return "3";
        }
*/

        user = await UserApi.instance.me();
        if (user != null &&
            user!.kakaoAccount != null &&
            user!.kakaoAccount!.email != null) {
          print('사용자 정보 요청 성공'
              '\n회원번호: ${user!.id}' // '!'를 사용하여 null임을 보장합니다.
              '\n닉네임: ${user!.kakaoAccount?.profile?.nickname}'
              '\n이메일: ${user!.kakaoAccount?.email}');

          bool emailExists = await authenticationManager
              .emailExist(user!.kakaoAccount!.email!);

          if (!emailExists) {
            //여기는 로그인해야함
            print("여기까지 됨");
            return "1";
          } else {
            //여기는 회원가입해야함
            print("화면으로 넘어가나");
            return "3";
          }
        }
      } catch (e) {
        print('사용자 정보 요청 실패: $e');
        // 에러 메시지 출력 및 필요한 추가 작업 수행
        return "-1";
      }
    }

    return "-1";
  }

  Future logout() async {
    await _socialLogin.sociallogout();
    isLogined = "";
    user = null;
  }

  String getNickname() {
    if (user != null &&
        user!.kakaoAccount != null &&
        user!.kakaoAccount!.profile != null &&
        user!.kakaoAccount!.profile!.nickname != null) {
      return user!.kakaoAccount!.profile!.nickname!;
    } else {
      return "";
    }
  }

  String getEmail() {
    if (user != null &&
        user!.kakaoAccount != null &&
        user!.kakaoAccount!.email != null) {
      return user!.kakaoAccount!.email!;
    } else {
      return "";
    }
  }

  String getGender() {
    if (user != null &&
        user!.kakaoAccount != null &&
        user!.kakaoAccount!.gender != null) {
      return user!.kakaoAccount!.gender.toString();
    } else {
      return "";
    }
  }

  String getBirth() {
    if (user != null &&
        user!.kakaoAccount != null &&
        user!.kakaoAccount!.birthday != null) {
      return user!.kakaoAccount!.birthday!;
    } else {
      return "";
    }
  }

  String getAuth() {
    return authCode;
  }
}
