abstract class HttpResult<T> {
  void success(T data, String functionName);
  void appFail(String functionName);
  void fail(Object error, String functionName);
}

class PrintHttpResult<T> implements HttpResult<T> {
  static const int appFailStatusCode = 400; // 예시로 400으로 설정

  @override
  void success(T data, String functionName) {
    // 성공 시 처리 로직
    print('$functionName 성공: $data');
  }
  @override
  void appFail(String functionName) {
    // 앱 실패 시 처리 로직
    print('$functionName 앱 실패');
  }
  @override
  void fail(Object error, String functionName) {
    // 실패 시 처리 로직
    print('$functionName 실패: $error');
  }

  void PrintResult(dynamic response,String functionName) {
    print('waiting');
    // 응답 처리
    if (response.statusCode == 200) {
      // GET 성공
      final responseData = response.data;
      success(responseData, functionName); // MyHttpResult 인스턴스의 success 메서드 호출
    } else {
      if (response.statusCode == appFailStatusCode) {
        appFail(functionName); // 앱 실패 시 appFail 메서드 호출
      } else {
        fail('응답 상태 코드: ${response.statusCode}', functionName);
      }
    }
  }
}