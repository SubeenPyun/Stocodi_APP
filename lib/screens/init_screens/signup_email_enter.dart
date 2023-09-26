import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/init_screens/signup_password.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class SignEmail extends StatefulWidget {
  const SignEmail({super.key});

  @override
  State<SignEmail> createState() => _SignEmailState();
}

class _SignEmailState extends State<SignEmail> {
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
              nosee: false,
              inputtype: TextInputType.emailAddress,
              frontboxsize: 22,
              imgName: 'email',
              text: '이메일 주소를 입력해주세요',
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 492,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignupPwd()));
              },
              child: const GreenLongBtn(text: '다음으로'),
            ),
          ],
        ),
      ),
    );
  }
}
