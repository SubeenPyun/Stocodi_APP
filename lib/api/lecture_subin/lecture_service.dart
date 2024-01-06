import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';
import '../retrofit/http_result.dart';

class LectureService {
  final Dio dio = Dio(); // Dio 인스턴스 생성
  final storage = FlutterSecureStorage();
  final PrintHttpResult _httpResult = PrintHttpResult(); // MyHttpResult 인스턴스 생성

  LectureService() {
    //dio.options.baseUrl = 'http://223.130.138.147:8080/api/v1'; // API 기본 URL로 변경
    dio.options.baseUrl = 'http://10.0.2.2:53001/api/v1';

    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
  }

  // 강의 하나 조회
  Future<Response> oneLecture(String lectureId) async {
    try {
      final response = await dio.get('/lectures/$lectureId');
      _httpResult.success(response, '강의 하나 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '강의 하나 조회');
      throw Exception('Failed to load one lecture: $e');
    }
  }

  // 강의 좋아요
  Future<Response> lectureLikes(String lectureId) async {
    try {
      final response = await dio.put('/likes/$lectureId');
      _httpResult.success(response, '강의 좋아요');
      return response;
    } catch (e) {
      _httpResult.fail(e, '강의 좋아요');
      throw Exception('Failed to like lecture: $e');
    }
  }

  // 조회수 올리기
  Future<Response> lectureViews(String lectureId) async {
    try {
      final response = await dio.post('/lectures/views/$lectureId');
      _httpResult.success(response, '조회수 올리기');
      return response;
    } catch (e) {
      _httpResult.fail(e, '조회수 올리기');
      throw Exception('Failed to increase lecture view: $e');
    }
  }

  // 댓글 작성
  Future<Response> writeComment() async {
    try {
      final response = await dio.post('/comments');
      _httpResult.success(response, '댓글 작성');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 작성');
      throw Exception('Failed to write comment: $e');
    }
  }

  // 댓글 삭제
  Future<Response> deleteComment(int lectureId) async {
    try {
      final response = await dio.post('/lectures/$lectureId');
      _httpResult.success(response, '댓글 삭제');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 삭제');
      throw Exception('Failed to delete comment: $e');
    }
  }
}
