import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stocodi_app/model/lecture/request/watching_lecture_model.dart';

import '../../../api/lecture/lecture_manager.dart';
import '../../../api/lecture/lecture_service.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String a;
  late Response<dynamic>? b;

  @override
  void initState() {
    super.initState();
    // init 함수를 initState에서 호출
    init();
  }

  init() async {
    a = (await LectureManager().isWatched(1))!;
    b = (await LectureManager().changeWatchedTime(WatchingLectureRequest(lecture_id: 1, time: '10분 1초')));
    setState(() {}); // init 호출 후 상태 갱신
  }

  // 각 버튼에 대한 기능을 정의
  void onPressedButton1(BuildContext context) {
    // 버튼 1을 눌렀을 때 수행할 기능
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(a),
          content: Text('Performing action for Button 1'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void onPressedButton2(BuildContext context) {
    // 버튼 2를 눌렀을 때 수행할 기능
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button 2 Pressed'),
          content: Text('Performing action for Button 2'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 각 버튼에 대한 기능을 할당
            ElevatedButton(
              onPressed: () {
                onPressedButton1(context);
              },
              child: Text('Button 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onPressedButton2(context);
              },
              child: Text('Button 2'),
            ),
            // 추가 버튼들...
          ],
        ),
      ),
    );
  }
}
