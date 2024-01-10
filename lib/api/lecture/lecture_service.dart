import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';
import '../../model/lecture/request/comment_model.dart';
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

  Future<Response> getComments(int lectureId) async {
    try {
      setHeader();
      //await setToken('access_token');
      final response = await dio.get('/comments/lectures/$lectureId');
      _httpResult.success(response.data["response"], '$lectureId 강의 댓글 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '$lectureId 강의 댓글 조회');
      throw Exception('Failed to load $lectureId lecture comments: $e');
    }
  }

  Future<Response> writeComment(CommentRequest comment) async {
    try {
      //setHeader();
      await setToken('access_token');
      final response = await dio.post('/comments', data: comment.toJson());
      _httpResult.success(response, '댓글 작성');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 작성');
      throw Exception('Failed to write comment: $e');
    }
  }

  Future<Response> deleteComment(int lectureId) async {
    try {
      final response = await dio.delete('/lectures/$lectureId');
      _httpResult.success(response, '댓글 삭제');
      return response;
    } catch (e) {
      _httpResult.fail(e, '댓글 삭제');
      throw Exception('Failed to delete comment: $e');
    }
  }

  Future<Response> addWatchingLectureList(int lectureId) async {
    try {
      await setToken('access_token');
      final response = await dio.post('/watchings/$lectureId');
      _httpResult.success(response, '시청 중 강의 추가');
      return response;
    } catch (e) {
      _httpResult.fail(e, '시청 중 강의 추가',addWatchingListStatusCheck);
      throw Exception('Failed to add watching lecture list: $e');
    }
  }


  Future<Response> getLectureList() async {
    try {
      setHeader();
      final response = await dio.get('/lectures');
      _httpResult.success(response.data["response"], '전체 강의 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '전체 강의 조회', getLectureListStatusCheck);
      throw Exception('Failed to get lecture list: $e');
    }
  }

  Future<Response> getWatchingLectureList() async {
    try {
      await setToken('access_token');
      final response = await dio.get('/watchings');
      _httpResult.success(response.data["response"], '시청 중 강의 조회');
      return response;
    } catch (e) {
      _httpResult.fail(e, '시청 중 강의 조회', getWatchingListStatusCheck);
      throw Exception('Failed to get watching lecture list: $e');
    }
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
      final response = await dio.put('/lectures/views/$lectureId');
      _httpResult.success(response, '조회수 올리기');
      return response;
      } catch (e) {
        _httpResult.fail(e, '조회수 올리기');
        throw Exception('Failed to increase lecture view: $e');
    }
  }

  void setHeader() {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<void> setToken(String token) async {
    final accessToken = await getToken(token);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
  }
  Future<String?> getToken(String token) async {
    return await storage.read(key: token);
  }
}

