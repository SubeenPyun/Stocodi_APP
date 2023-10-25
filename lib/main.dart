import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stocodi_app/sign_up/signup.dart';

import 'package:stocodi_app/sign_up/splash_screen.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future:
          Future.delayed(const Duration(seconds: 3), () => "Intro Completed."),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: _splashLoadingWidget(snapshot));
      },
    ));
  }

  Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      return const Text("Error!!");
    } else if (snapshot.hasData) {
      // return const AppScreen();
      return const Signup();
    } else {
      return const Splash_Screen();
    }
  }
}
