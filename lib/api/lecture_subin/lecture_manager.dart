import 'package:dio/dio.dart';
import 'package:stocodi_app/api/lecture_subin/lecture_service.dart';
import 'package:stocodi_app/model/lecture/response/lecture_response.dart';

import '../../model/auth/request/login_model.dart';
import '../../model/auth/request/members_model.dart';
import '../../model/auth/response/account_model.dart';
import '../../model/auth/response/login_model.dart';
import '../../model/portfolio/request/accounts_model.dart';
import '../../model/portfolio/response/portfolio_response.dart';

class LectureManager {
  final LectureService _apiService = LectureService();
  static final LectureManager _instance =
      LectureManager._internal();

  factory LectureManager() {
    return _instance;
  }

  LectureManager._internal();

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

  // 강의 좋아요
  Future<Response?> lectureLikes(String lectureId) async {
    try {
      final response = await _apiService.lectureLikes(lectureId);
      return response;
    } catch (e) {
      print('강의 좋아요 오류: $e');
    }
    return null;
  }

  // 조회수 올리기
  Future<Response?> lectreViews(String lectureId) async {
    try {
      final response = await _apiService.lectureViews(lectureId);
      return response;
    } catch (e) {
      print('조회수 올리기 오류: $e');
    }
    return null;
  }

  // 댓글 작성
  Future<Response?> writeComment() async {
    try {
      final response = await _apiService.writeComment();
      return response;
    } catch (e) {
      print('댓글 작성 오류: $e');
    }
    return null;
  }

  // 댓글 삭제
  Future<Response?> deleteComment(int lectureId) async {
    try {
      final response = await _apiService.deleteComment(lectureId);
      return response;
    } catch (e) {
      print('댓글 삭제 오류: $e');
    }
    return null;
  }
}
