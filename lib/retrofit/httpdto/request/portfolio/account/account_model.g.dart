// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      json['account_name'] as String,
      json['total_asset_evaluation'] as int,
      (json['cumulative_returns'] as num).toDouble(),
      json['remain_cash'] as int,
      json['unrealized_gain'] as int,
      json['stock_valuation'] as int,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'account_name': instance.account_name,
      'total_asset_evaluation': instance.total_asset_evaluation,
      'cumulative_returns': instance.cumulative_returns,
      'remain_cash': instance.remain_cash,
      'unrealized_gain': instance.unrealized_gain,
      'stock_valuation': instance.stock_valuation,
    };
