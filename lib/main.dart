import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_http_request.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{

  await initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppScreen(),
    );
  }
}

