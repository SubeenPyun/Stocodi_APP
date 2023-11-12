// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasesResponse _$PurchasesResponseFromJson(Map<String, dynamic> json) =>
    PurchasesResponse(
      account_name: json['account_name'] as String,
      remain_cash: json['remain_cash'] as int,
      total_price: json['total_price'] as int,
      total_quantity: json['total_quantity'] as int,
    );

Map<String, dynamic> _$PurchasesResponseToJson(PurchasesResponse instance) =>
    <String, dynamic>{
      'account_name': instance.account_name,
      'remain_cash': instance.remain_cash,
      'total_price': instance.total_price,
      'total_quantity': instance.total_quantity,
    };
