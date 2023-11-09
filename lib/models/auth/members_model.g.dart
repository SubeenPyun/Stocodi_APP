// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Members _$MembersFromJson(Map<String, dynamic> json) => Members(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      interestCategories: (json['interestCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$MembersToJson(Members instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'interestCategories': instance.interestCategories,
      'birthDate': instance.birthDate.toIso8601String(),
    };
