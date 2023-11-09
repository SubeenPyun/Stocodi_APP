// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchases _$PurchasesFromJson(Map<String, dynamic> json) => Purchases(
      account_name: json['account_name'] as String,
      stock_name: json['stock_name'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$PurchasesToJson(Purchases instance) => <String, dynamic>{
      'account_name': instance.account_name,
      'stock_name': instance.stock_name,
      'price': instance.price,
      'quantity': instance.quantity,
    };
