// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockRank _$StockRankFromJson(Map<String, dynamic> json) => StockRank(
      json['rank'] as int,
      json['stockCode'] as String,
      json['stockName'] as String,
      json['currentPrice'] as int,
      json['volume'] as int,
    );

Map<String, dynamic> _$StockRankToJson(StockRank instance) => <String, dynamic>{
      'rank': instance.rank,
      'stockCode': instance.stockCode,
      'stockName': instance.stockName,
      'currentPrice': instance.currentPrice,
      'volume': instance.volume,
    };
