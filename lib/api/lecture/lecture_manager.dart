import 'package:dio/dio.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';
import '../../model/lecture/request/comment_model.dart';
import '../../model/lecture/response/comment_response.dart';
import 'lecture_service.dart';

class LectureManager {
  final LectureService _apiService = LectureService();
  static final LectureManager _instance =
      LectureManager._internal();

  factory LectureManager() {
    return _instance;
  }

  LectureManager._internal();

  Future<List<CommentResponse>?> getComments(int lectureId) async {
    try {
      final response = await _apiService.getComments(lectureId);
      List<CommentResponse> commentResponses =
      (response.data['response'] as List)
          .map((json) => CommentResponse.fromJson(json))
          .toList();
      return commentResponses;
    } catch (e) {
      print('$lectureId 강의 댓글 조회 오류: $e');
      return null;
    }
  }

  Future<Response?> writeComment(CommentRequest comment) async {
    try {
      final response = await _apiService.writeComment(comment);
      return response;
    } catch (e) {
      print('댓글 작성 오류: $e');
      return null;
    }
  }

  Future<Response?> deleteComment(int lectureId) async {
    try {
      final response = await _apiService.deleteComment(lectureId);
      return response;
    } catch (e) {
      print('댓글 삭제 오류: $e');
    }
    return null;
  }

  Future<Response?> addWatchingLectureList(int lectureId) async {
    try {
      final response = await _apiService.addWatchingLectureList(lectureId);
      return response;
    } catch (e) {
      print('시청 중 강의 추가 오류: $e');
      return null;
    }
  }


  Future<List<LectureResponse>?> getLectureList() async {
    try {
      final response = await _apiService.getLectureList();
      List<LectureResponse> lectureResponses =
      (response.data['response'] as List)
          .map((json) => LectureResponse.fromJson(json))
          .toList();
      return lectureResponses;
    } catch (e) {
      print('전체 강의 리스트 조회 오류: $e');
      return null;
    }
  }

  Future<List<LectureResponse>?> getWatchingLectureList() async {
    try {
      final response = await _apiService.getWatchingLectureList();
      List<LectureResponse> lectureResponses =
      (response.data['response'] as List)
          .map((json) => LectureResponse.fromJson(json))
          .toList();
      return lectureResponses;
    } catch (e) {
      print('시청 중 강의 리스트 조회 오류: $e');
      return null;
    }
  }

  // 강의 하나 조회
  Future<LectureResponse?> oneLecture(String lectureId) async {
    try {
      final response = await _apiService.oneLecture(lectureId);
      final responseData = response.data['response']; // 데이터 추출
      LectureResponse lectureResponse = LectureResponse.fromJson(responseData);
      return lectureResponse;
    } catch (e) {
      print('강의 하나 조회 오류: $e');
    }
    return null;
  }

  // 강의 좋아요 확인
  Future<bool?> checkLike(String lectureId) async {
    try {
      final response = await _apiService.checkLike(lectureId);
      final responseData = response.data['response'];
      return responseData;
    } catch (e) {
      print('강의 좋아요 확인 오류: $e');
    }
    return null;
  }

  // 강의 좋아요 OnOff
  Future<bool?> likeOnOff(String lectureId) async {
    try {
      final response = await _apiService.likeOnOff(lectureId);
      final responseData = response.data['response'];
      return responseData;
    } catch (e) {
      print('강의 좋아요 OnOff 오류: $e');
    }
    return null;
  }

  // 조회수 올리기
  Future<Response?> lectureViews(String lectureId) async {
    try {
      final response = await _apiService.lectureViews(lectureId);
      return response;
    } catch (e) {
      print('조회수 올리기 오류: $e');
    }
    return null;
  }

  // 강의 검색
  Future<LectureResponse?> lectureSearch(String key) async {
    try {
      final response = await _apiService.oneLecture(key);
      final responseData = response.data['response']; // 데이터 추출
      LectureResponse lectureResponse = LectureResponse.fromJson(responseData);
      return lectureResponse;
    } catch (e) {
      print('강의 검색: $e');
    }
    return null;
  }
}
