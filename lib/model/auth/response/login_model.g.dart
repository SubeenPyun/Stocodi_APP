// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      member_id: json['member_id'] as int,
      member_nickname: json['member_nickname'] as String,
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'member_id': instance.member_id,
      'member_nickname': instance.member_nickname,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
