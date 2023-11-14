// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_chart_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockChartInfo _$StockChartInfoFromJson(Map<String, dynamic> json) =>
    StockChartInfo(
      json['stock_name'] as String,
      json['first_price'] as int,
      json['high_price'] as int,
      json['low_price'] as int,
      json['last_price'] as int,
      json['volume'] as int,
      json['trading_value'] as int,
      (json['fluctuation_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$StockChartInfoToJson(StockChartInfo instance) =>
    <String, dynamic>{
      'stock_name': instance.stock_name,
      'first_price': instance.first_price,
      'high_price': instance.high_price,
      'low_price': instance.low_price,
      'last_price': instance.last_price,
      'volume': instance.volume,
      'trading_value': instance.trading_value,
      'fluctuation_rate': instance.fluctuation_rate,
    };
