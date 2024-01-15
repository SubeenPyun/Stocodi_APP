import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/screens/app.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import 'package:stocodi_app/screens/sign_up/signup.dart';
import 'package:stocodi_app/screens/sign_up/splash_screen.dart';
import 'API/retrofit/auth_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  KakaoSdk.init(nativeAppKey: '2b8c8978e959e4c010dec60a9a4594fb');
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authenticationManager = AuthenticationManager();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> autoLogin(BuildContext context) async {
    try {
      var storedAccessToken =
          await authenticationManager.getToken("access_token");

      // 저장된 토큰이 있으면 자동 로그인 시도
      final success = await authenticationManager.newToken();

      if (success) {
        var memberResponse = await authenticationManager.accountInfo();

        if (memberResponse == null) {
          Fluttertoast.showToast(
            msg: "계정 정보를 조회하는데 실패하였습니다.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff0ECB81),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          print("자동로그인 했을 때 여기는 멤버아이디 >> ${memberResponse.id}");
          PortfolioData portfolioData =
              Provider.of<PortfolioData>(context, listen: false);
          portfolioData.memberId = memberResponse.id;
          portfolioData.updateSelectedMemberId(memberResponse.id);
        }
        // 자동 로그인 성공하면 2초 지연 후 AppScreen으로 이동
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AppScreen(),
          ),
        );
      } else {
        // 토큰이 없으면 2초 지연 후 Signup 페이지로 이동
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Signup(),
          ),
        );
      }
    } catch (e) {
      // 오류 처리
      // 토큰이 없거나 자동 로그인 실패할 경우 2초 지연 후 Signup 페이지로 이동
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Signup(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PortfolioData(),
      child: MaterialApp(
        navigatorObservers: [FirebaseAnalyticsObserver(analytics: _analytics)], // 여기에 옵서버 추가
        home: Builder(
          builder: (context) => FutureBuilder(
            future: autoLogin(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: _splashLoadingWidget(snapshot),
                );
              } else {
                // 여기서 로딩 중인 상태에 해당하는 위젯을 반환할 수 있습니다.
                return const Splash_Screen();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      return const Scaffold(
        body: Center(
          child: Text("Error!!"),
        ),
      );
    } else {
      // 여기에 로딩 완료 후에 보여줄 위젯을 반환할 수 있습니다.
      return Container();
    }
  }
}