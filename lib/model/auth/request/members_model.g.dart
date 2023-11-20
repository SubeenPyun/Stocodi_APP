// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembersRequest _$MembersRequestFromJson(Map<String, dynamic> json) =>
    MembersRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      interest_categories: (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      birth_date: json['birth_date'] as String,
    );

Map<String, dynamic> _$MembersRequestToJson(MembersRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'interest_categories': instance.interest_categories,
      'birth_date': instance.birth_date,
    };
