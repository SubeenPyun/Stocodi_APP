// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_chart_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockChartInfo _$StockChartInfoFromJson(Map<String, dynamic> json) =>
    StockChartInfo(
      json['stockName'] as String,
      json['firstPrice'] as int,
      json['highPrice'] as int,
      json['lowPrice'] as int,
      json['lastPrice'] as int,
      json['volume'] as int,
      json['tradingValue'] as int,
      (json['fluctuationRate'] as num).toDouble(),
    );

Map<String, dynamic> _$StockChartInfoToJson(StockChartInfo instance) =>
    <String, dynamic>{
      'stockName': instance.stockName,
      'firstPrice': instance.firstPrice,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'lastPrice': instance.lastPrice,
      'volume': instance.volume,
      'tradingValue': instance.tradingValue,
      'fluctuationRate': instance.fluctuationRate,
    };
