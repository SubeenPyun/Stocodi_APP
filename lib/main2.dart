import 'package:flutter/material.dart';

void main() {
  runApp(Main2());
}

class Main2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/images/back.png',
                width: 10,
                height: 20,
              ),
              onPressed: null,
            ),
          ),
          title: Text(
            "로그인",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}