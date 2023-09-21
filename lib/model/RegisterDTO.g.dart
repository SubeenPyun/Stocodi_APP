// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDTO _$RegisterDTOFromJson(Map<String, dynamic> json) => RegisterDTO(
      json['email'] as String,
      json['name'] as String,
      json['password'] as String,
      json['nickname'] as String,
      json['birth_date'] as String,
      (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      (json['gender'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RegisterDTOToJson(RegisterDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'nickname': instance.nickname,
      'birth_date': instance.birth_date,
      'interest_categories': instance.interest_categories,
      'roles': instance.roles,
      'gender': instance.gender,
    };
