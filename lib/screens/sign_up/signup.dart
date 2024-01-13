import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stocodi_app/api/retrofit/auth_manager.dart';
import 'package:stocodi_app/model/auth/kakao/Kakao_login.dart';
import 'package:stocodi_app/model/auth/kakao/social_viewmodel.dart';
import 'package:stocodi_app/model/auth/request/kakao_auth_model.dart';
import 'package:stocodi_app/screens/sign_up/kakao_signup_detail.dart';
import 'package:stocodi_app/screens/sign_up/signup_done.dart';
import 'package:stocodi_app/screens/sign_up/signup_email_enter.dart';
import 'package:stocodi_app/screens/sign_up/tmp_signup_password.dart';
import '../../widgets/long_btn.dart';
import '../login/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final socialviewmodel = SocialViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.08,
              MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).size.height * 0.14,
              MediaQuery.of(context).size.width * 0.08,
              MediaQuery.of(context).size.height * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Stocodi ',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 28,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '에',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 28,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                ),
                const Text(
                  '처음 방문하시나요?',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 28,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.089,
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "서비스 준비 중입니다.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xff0ECB81),
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: LongButton(
                    frontboxsize: 22,
                    imgName: 'google_login.png',
                    text: '구글 계정으로 시작하기',
                    borderColor: Color(0xFFEBEBEB),
                    textColor: Color(0xFF767676),
                    height: MediaQuery.of(context).size.height * 0.0627,
                    imgsize: 24,
                    betweensize: 12,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "서비스 준비 중입니다.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xff0ECB81),
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: LongButton(
                    frontboxsize: 22,
                    imgName: 'naver_login.png',
                    text: '네이버 계정으로 시작하기',
                    borderColor: Color(0xFFEBEBEB),
                    textColor: Color(0xFF767676),
                    height: MediaQuery.of(context).size.height * 0.0627,
                    imgsize: 24,
                    betweensize: 12,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    String isLoggedIn = await socialviewmodel.login();
                    if (isLoggedIn == "3") {
                      String kakaonickname = socialviewmodel.getNickname();
                      String kakaoemail = socialviewmodel.getEmail();
                      String kakaogender = socialviewmodel.getGender();
                      // 회원가입하려면 SignDone 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TmpSignupPwd(
                            enteredEmail: kakaoemail,
                            enteredNickName: kakaonickname,
                            enteredGender: kakaogender,
                          ),
                        ),
                      );
                    } else if (isLoggedIn == "-1") {
                      // 로그인이 실패한 경우에 대한 처리
                      // 예: 에러 메시지 표시 또는 다른 작업 수행
                      Fluttertoast.showToast(
                        msg: "이메일이 인증되지 않았습니다.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xff0ECB81),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else if (isLoggedIn == '1') {
                      Fluttertoast.showToast(
                        msg: "이미 회원가입되어 있습니다.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xff0ECB81),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  child: LongButton(
                    frontboxsize: 22,
                    imgName: 'kakao_login.png',
                    text: '카카오 계정으로 시작하기',
                    borderColor: Color(0xFFEBEBEB),
                    textColor: Color(0xFF767676),
                    height: MediaQuery.of(context).size.height * 0.0627,
                    imgsize: 24,
                    betweensize: 12,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignEmail(),
                      ),
                    );
                  },
                  child: LongButton(
                    frontboxsize: 22,
                    imgName: 'email_login.png',
                    text: '이메일 계정으로 시작하기',
                    borderColor: Color(0xFFEBEBEB),
                    textColor: Color(0xFF767676),
                    height: MediaQuery.of(context).size.height * 0.0627,
                    imgsize: 24,
                    betweensize: 12,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.036,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '이미 계정이 있다면 ',
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          color: Color(0xFF0ECB81),
                          fontSize: 14,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0ECB81),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
