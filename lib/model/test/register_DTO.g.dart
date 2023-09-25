// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_DTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDTO _$RegisterDTOFromJson(Map<String, dynamic> json) => RegisterDTO(
      json['email'] as String,
      json['password'] as String,
      json['name'] as String,
      json['nickname'] as String,
      json['birthDate'] as String,
      (json['interestCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['gender'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RegisterDTOToJson(RegisterDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'birthDate': instance.birthDate,
      'interestCategories': instance.interestCategories,
      'gender': instance.gender,
    };
