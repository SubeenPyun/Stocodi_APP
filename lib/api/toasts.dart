import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Color(0xff0ECB81),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void prepare(String message) {
  showToast(message);
}