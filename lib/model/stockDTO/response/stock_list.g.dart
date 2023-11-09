// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockList _$StockListFromJson(Map<String, dynamic> json) => StockList(
      (json['stockList'] as List<dynamic>)
          .map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockListToJson(StockList instance) => <String, dynamic>{
      'stockList': instance.stockList,
    };
