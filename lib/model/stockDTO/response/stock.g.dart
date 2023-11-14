// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      json['stock_code'] as String,
      json['stock_name'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'stock_code': instance.stock_code,
      'stock_name': instance.stock_name,
    };
