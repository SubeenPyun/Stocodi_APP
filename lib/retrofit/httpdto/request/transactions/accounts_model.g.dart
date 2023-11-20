// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioRequest _$PortfolioRequestFromJson(Map<String, dynamic> json) =>
    PortfolioRequest(
      account_name: json['account_name'] as String,
      initial_cash: json['initial_cash'] as int,
    );

Map<String, dynamic> _$PortfolioRequestToJson(PortfolioRequest instance) =>
    <String, dynamic>{
      'account_name': instance.account_name,
      'initial_cash': instance.initial_cash,
    };
