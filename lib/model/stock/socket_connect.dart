import 'package:json_annotation/json_annotation.dart';

part 'socket_connect.g.dart';

@JsonSerializable()
class SocketConnect{
  final int id;

  SocketConnect(this.id);

  Map<String, dynamic> toJson() => _$SocketConnectToJson(this);

  factory SocketConnect.fromJson(Map<String, dynamic> json) =>
      _$SocketConnectFromJson(json);
}

