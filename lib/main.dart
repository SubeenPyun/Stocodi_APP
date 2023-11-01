import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/splash_screen.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'chart/ChartDetail.dart';
import 'chart/charttest.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChartDetail()
    );
  }
}
