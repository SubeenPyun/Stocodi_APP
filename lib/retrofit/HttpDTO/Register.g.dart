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
      json['birthDate'] as String,
      json['gender'] as String,
      json['interestCategories'] as String,
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'interestCategories': instance.interestCategories,
    };
