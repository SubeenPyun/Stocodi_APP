import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
  // https://dev-yakuza.posstree.com/ko/flutter/http/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  void _callAPI() async {
    var logger = Logger(
      printer: PrettyPrinter(),
    );

    var url = Uri.parse(
      'http://49.50.175.59:8080/api/v1/users/nickname/exists?nickname=예리미양',
    );

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    logger.d('print logger success');

    // var url = Uri.parse(
    //   'http://49.50.175.59:8080/api/v1/users/email/exists?email=rim0399@naver.com',
    // );
    // var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // var url = Uri.parse('http://49.50.175.59:8080/api/v1/users/register');
    // print(['USER'].join('').runtimeType);
    // var response = await http.post(url,
    //     headers: {
    //       "Content-Type": "application/json",
    //       "alg": "HS256",
    //     },
    //     body: jsonEncode(
    //     {
    //     'email':'test@naver.com',
    //     'name':'편수빈',
    //     'password':'1234',
    //     'nickname':'봉봉',
    //     'birth_date':'2001-07-03',
    //     'interest_categories':'IT',
    //     'roles':['USER'].join(''),
    //   }));
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('api Example'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
         child: ElevatedButton(
          onPressed:_callAPI,
          child: const Text('Call API'),
        ),
      ),
    );
  }
}