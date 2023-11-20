import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'socket_connect.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class SocketConnect{
  final int id;

  SocketConnect(this.id);

  Map<String, dynamic> toJson() => _$SocketConnectToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory SocketConnect.fromJson(Map<String, dynamic> json) =>
      _$SocketConnectFromJson(json);
}

