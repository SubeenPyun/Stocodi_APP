// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_members_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoMembersRequest _$KakaoMembersRequestFromJson(Map<String, dynamic> json) =>
    KakaoMembersRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      gender: json['gender'] as String,
      interest_categories: (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      birth_date: json['birth_date'] as String,
    );

Map<String, dynamic> _$KakaoMembersRequestToJson(
        KakaoMembersRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'interest_categories': instance.interest_categories,
      'birth_date': instance.birth_date,
    };
