// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      json['stockCode'] as String,
      json['stockName'] as String,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'stockCode': instance.stockCode,
      'stockName': instance.stockName,
    };
