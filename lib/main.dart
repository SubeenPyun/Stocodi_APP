import 'package:flutter/material.dart';
import 'stocodi_api_test.dart';
import 'DongGiTestPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // 앱의 첫 화면을 설정
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // 첫 번째 버튼을 누르면 두 번째 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text('api test'),
            ),
            ElevatedButton(
              onPressed: () {
                // 첫 번째 버튼을 누르면 두 번째 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DongGi()),
                );
              },
              child: Text('DongGiTestPage'),
            ),
          ],
        ),
      ),
    );
  }
}
