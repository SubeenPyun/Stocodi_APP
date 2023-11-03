import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0ECB81),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/stocodi_splash.png',
                width: 192,
                height: 60,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: '투자를 알고 재미있게, ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w500,
                      height: 0.06,
                      letterSpacing: -0.50,
                    ),
                  ),
                  TextSpan(
                    text: '스토코디',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Pretendard Variable',
                      fontWeight: FontWeight.w800,
                      height: 0.06,
                      letterSpacing: -0.50,
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
