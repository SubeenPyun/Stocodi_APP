// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoResponse _$AccountInfoResponseFromJson(Map<String, dynamic> json) =>
    AccountInfoResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      birth_date: json['birth_date'] as String,
      gender: json['gender'] as String,
      interest_categories: (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$AccountInfoResponseToJson(
        AccountInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'interest_categories': instance.interest_categories,
      'role': instance.role,
    };
