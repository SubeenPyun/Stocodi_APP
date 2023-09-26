import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/init_screens/interests.dart';
import 'package:stocodi_app/screens/init_screens/signup_password.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class SignDetail extends StatefulWidget {
  const SignDetail({super.key});

  @override
  State<SignDetail> createState() => _SignDetailState();
}

class _SignDetailState extends State<SignDetail> {
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
              '거의 다 왔어요!',
              style: TextStyle(
                color: Color(0xFF191919),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            const TextEditBtn(
              nosee: false,
              inputtype: TextInputType.name,
              frontboxsize: 22,
              imgName: 'person',
              text: '이름을 입력해주세요',
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 16,
            ),
            const TextEditBtn(
              nosee: false,
              inputtype: TextInputType.name,
              frontboxsize: 22,
              imgName: 'nick',
              text: '사용할 닉네임을 입력해주세요',
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 16,
            ),
            const TextEditBtn(
              nosee: false,
              inputtype: TextInputType.number,
              frontboxsize: 22,
              imgName: 'birth',
              text: '생년월일을 입력해주세요 (8자리)',
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 16,
            ),
            const TextEditBtn(
              nosee: false,
              inputtype: TextInputType.phone,
              frontboxsize: 22,
              imgName: 'phone',
              text: '휴대폰 번호를 입력해주세요 (숫자만 입력)',
              betweenboxsize: 6,
            ),
            const SizedBox(
              height: 274,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Interest()));
              },
              child: const GreenLongBtn(text: '다음으로'),
            ),
          ],
        ),
      ),
    );
  }
}
