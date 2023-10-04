import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/init_screens/signup_email_enter.dart';
import 'package:stocodi_app/widgets/longbtn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 131, 32, 0),
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
              ), // 간격 추가
              const Text(
                '처음 방문하시나요?',
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontSize: 28,
                  fontFamily: 'Pretendard Variable',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const LongButton(
                frontboxsize: 28,
                imgName: 'google_login.png',
                text: '구글 계정으로 시작하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
              ),
              const SizedBox(
                height: 16,
              ),
              const LongButton(
                frontboxsize: 22,
                imgName: 'naver_login.png',
                text: '네이버 계정으로 시작하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
              ),
              const SizedBox(
                height: 16,
              ),
              const LongButton(
                frontboxsize: 22,
                imgName: 'kakao_login.png',
                text: '카카오 계정으로 시작하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
              ),
              const SizedBox(
                height: 16,
              ),
              const LongButton(
                frontboxsize: 22,
                imgName: 'email_login.png',
                text: '이메일 계정으로 시작하기',
                borderColor: Color(0xFFEBEBEB),
                textColor: Color(0xFF767676),
              ),
              const SizedBox(
                height: 32,
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
                              //여기 수정 예정. 로그인 페이지로 바로 가야함
                              builder: (context) => const SignEmail()));
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
    );
  }
}
