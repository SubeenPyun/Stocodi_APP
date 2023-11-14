// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_rank_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockRankList _$StockRankListFromJson(Map<String, dynamic> json) =>
    StockRankList(
      (json['stock_rank_list'] as List<dynamic>)
          .map((e) => StockRank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockRankListToJson(StockRankList instance) =>
    <String, dynamic>{
      'stock_rank_list': instance.stock_rank_list,
    };
