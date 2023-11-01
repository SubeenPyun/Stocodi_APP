import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/signup_deatil.dart';
import 'package:stocodi_app/widgets/gray_editTextSimilar.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/inputField.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class SignupPwd extends StatefulWidget {
  const SignupPwd({super.key});

  @override
  State<SignupPwd> createState() => _SignupPwdState();
}

class _SignupPwdState extends State<SignupPwd> {
  bool isTyping = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).padding.top +
              MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.08,
          MediaQuery.of(context).size.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back_toggle.png',
                width: MediaQuery.of(context).size.width * 0.025,
                height: MediaQuery.of(context).size.height * 0.022,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.056,
            ),
            const Text(
              '이메일로 시작하기',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            TextEditBtn(
              inputtype: TextInputType.text,
              frontboxsize: 22,
              icon: Icons.lock,
              text: '비밀번호를 입력해주세요',
              nosee: true,
              betweenboxsize: 6,
              height: MediaQuery.of(context).size.height * 0.0627,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.017,
            ),
            const GraySimilarEdit(
              frontboxsize: 22,
              imgName: 'email',
              text: '우선시험용@naver.com',
              betweenboxsize: 6,
              imgColor: 'gray',
              boxColor: Color(0xFFEBEBEB),
              textColor: Color(0xFFBDBDBD),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignDetail()));
              },
              child: GreenLongBtn(
                text: '다음으로',
                height: MediaQuery.of(context).size.height * 0.067,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
