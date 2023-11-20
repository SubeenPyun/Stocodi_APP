// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockRank _$StockRankFromJson(Map<String, dynamic> json) => StockRank(
      json['rank'] as int,
      json['stock_code'] as String,
      json['stock_name'] as String,
      json['current_price'] as int,
      json['volume'] as int,
    );

Map<String, dynamic> _$StockRankToJson(StockRank instance) => <String, dynamic>{
      'rank': instance.rank,
      'stock_code': instance.stock_code,
      'stock_name': instance.stock_name,
      'current_price': instance.current_price,
      'volume': instance.volume,
    };
