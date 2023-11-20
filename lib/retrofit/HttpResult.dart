import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class HttpResult<T> {
  void success(T data, String functionName) {
    print('$functionName 성공: $data');
  }
  void fail(Object error, String functionName, Function(int statuscode)? statusWithTask){
    print('$functionName 실패: $error');
  }
}

class PrintHttpResult<T> implements HttpResult<T> {
  @override
  void fail(Object error, String functionName, [Function(int statuscode)? statusWithTask]) {
    if (error is DioError) {
      if (error.response != null) {
        print(error.response!.statusCode!);
        if(statusWithTask!=null)statusWithTask(error.response!.statusCode!);
      } else {
        print('response가 null');
      }
    } else {
      print('로그인 오류: $error');
    }
  }
  @override
  void success(T data, String functionName) {
    print('$functionName 성공: $data');
  }
}

void loginStatusCheck(int statusCode) {
  // statusCode를 활용한 특정 동작 수행
  if(statusCode == 400){
    showToast('비밀번호가 잘못되었습니다.');
  }
  else if(statusCode == 404){
    showToast('계정이 존재하지 않습니다');
  }
}
void nickNameStatusCheck(int statusCode) {
  // statusCode를 활용한 특정 동작 수행
  if(statusCode == 500){
    showToast('이미 존재하는 닉네임 입니다.');
  }
}
void emailStatusCheck(int statusCode) {
  // statusCode를 활용한 특정 동작 수행
  if(statusCode == 500){
    showToast('이미 존재하는 이메일 입니다.');
  }
}
void accountInfoStatusCheck(int statusCode) {
  // statusCode를 활용한 특정 동작 수행
  if(statusCode == 400){
    showToast('계정 정보 조회 실패');
  }
}
void newTokenStatusCheck(int statusCode) {
  if(statusCode == 444){
    showToast('계정 토큰 재발급 실패 (Refresh Token Cookie 없음).');
  }
}
void stockSellStatusCheck(int statusCode) {
  if(statusCode == 400){
    showToast('주식 판매 실패');
  }
}
void makePortfolioStatusCheck(int statusCode) {
  if(statusCode == 400){
    showToast('계좌 생성 실패');
  }
}
void getPortfolioStatusCheck(int statusCode) {
  if(statusCode == 404){
    showToast('get portfolio 정보 불일치');
  }
}


void showToast(String message) {
  print(message);
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,  // Toast.LENGTH_SHORT 또는 Toast.LENGTH_LONG
    gravity: ToastGravity.BOTTOM,    // 위치 설정 가능
    timeInSecForIosWeb: 1,          // iOS 및 웹에서 표시 시간 설정
    backgroundColor: Colors.black,   // 배경색 설정
    textColor: Colors.white,        // 텍스트 색상 설정
  );
}