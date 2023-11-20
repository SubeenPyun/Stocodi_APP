// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      json['email'] as String,
      json['password'] as String,
      json['name'] as String,
      json['nickname'] as String,
      json['birth_date'] as String,
      json['gender'] as String,
      (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'interest_categories': instance.interest_categories,
    };
