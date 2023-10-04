import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/interests.dart';
import 'package:stocodi_app/widgets/green_longbtn.dart';
import 'package:stocodi_app/widgets/textEditBtn.dart';

class SignDone extends StatefulWidget {
  const SignDone({super.key});

  @override
  State<SignDone> createState() => _SignDoneState();
}

class _SignDoneState extends State<SignDone> {
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '닉네임 ',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard Variable',
                  ),
                ),
                Text(
                  '님,',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard Variable',
                  ),
                ),
              ],
            ),
            const Text(
              '환영해요!',
              style: TextStyle(
                color: Color(0xFF0ECB81),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
              '회원가입이 완료되었습니다.',
              style: TextStyle(
                color: Color(0xFF767676),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const Text(
              'Stocodi 와 함께 새로운 투자 경험을 만들어봐요.',
              style: TextStyle(
                color: Color(0xFF767676),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/fire.png',
                  width: 240,
                  height: 240,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(
              height: 182,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, //여기도 다시 수정해야 함
                    MaterialPageRoute(builder: (context) => const Interest()));
              },
              child: const GreenLongBtn(text: '메인으로'),
            ),
          ],
        ),
      ),
    );
  }
}
