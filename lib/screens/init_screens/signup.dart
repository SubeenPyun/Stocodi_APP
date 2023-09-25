import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.fromLTRB(32, 87, 32, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                        height: 0.05,
                        letterSpacing: -0.70,
                      ),
                    ),
                    TextSpan(
                      text: '에',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 28,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w400,
                        height: 0.05,
                        letterSpacing: -0.70,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 26), // 간격 추가
                const Text(
                  '처음 방문하시나요?',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 28,
                    fontFamily: 'Pretendard Variable',
                    fontWeight: FontWeight.w400,
                    height: 0.05,
                    letterSpacing: -0.70,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFF5F5F5),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(children: []),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
