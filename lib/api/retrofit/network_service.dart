import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkService {
  final JsonDecoder _decoder = JsonDecoder();
  final JsonEncoder _encoder = JsonEncoder();
  final Dio _dio = Dio();

  Map<String, String> headers = {"content-type": "application/json"};
  Map<String, String> cookies = {};

  NetworkService() {
    // 이 부분에 필요한 초기화 코드를 추가할 수 있습니다.
  }

  void _updateCookie(Response response) {
    // 서버에서 설정한 쿠키를 업데이트합니다.
    String allSetCookie = response.headers['set-cookie'] as String;

    var setCookies = allSetCookie.split(',');

    for (var setCookie in setCookies) {
      var cookies = setCookie.split(';');

      for (var cookie in cookies) {
        _setCookie(cookie);
      }
    }

    headers['cookie'] = _generateCookieHeader();
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key != 'path' && key != 'expires') {
          cookies[key] = value;
        }
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) {
        cookie += "; ";
      }
      cookie += "$key=${cookies[key]}";
    }

    return cookie;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      _updateCookie(response);

      final String res = response.data.toString();
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode >= 400) {
        throw Exception("Error while fetching data");
      }

      return _decoder.convert(res);
    } catch (error) {
      throw Exception("Error while fetching data: $error");
    }
  }

  Future<dynamic> post(String url, {body, encoding}) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
        ),
      );

      _updateCookie(response);

      final String res = response.data.toString();
      final int? statusCode = response.statusCode;

      if (statusCode! < 200 || statusCode >= 400) {
        throw Exception("Error while fetching data");
      }

      return _decoder.convert(res);
    } catch (error) {
      throw Exception("Error while fetching data: $error");
    }
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 400;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}
