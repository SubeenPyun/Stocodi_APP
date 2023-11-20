// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_holding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockHoldingModel _$StockHoldingModelFromJson(Map<String, dynamic> json) =>
    StockHoldingModel(
      json['stock_name'] as String,
      json['stock_valuation'] as int,
      (json['stock_valuation_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$StockHoldingModelToJson(StockHoldingModel instance) =>
    <String, dynamic>{
      'stock_name': instance.stock_name,
      'stock_valuation': instance.stock_valuation,
      'stock_valuation_rate': instance.stock_valuation_rate,
    };
