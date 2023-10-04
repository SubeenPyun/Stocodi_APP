import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/signup_deatil.dart';
import 'package:stocodi_app/widgets/gray_editTextSimilar.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
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
        padding: const EdgeInsets.fromLTRB(32, 62, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back_toggle.png',
                width: 10,
                height: 20,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 50,
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
            const SizedBox(
              height: 32,
            ),
            const TextEditBtn(
              inputtype: TextInputType.text,
              frontboxsize: 22,
              imgName: 'lock',
              text: '비밀번호를 입력해주세요',
              nosee: true,
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 16,
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
            const SizedBox(
              height: 420,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignDetail()));
              },
              child: const GreenLongBtn(text: '다음으로'),
            ),
          ],
        ),
      ),
    );
  }
}
