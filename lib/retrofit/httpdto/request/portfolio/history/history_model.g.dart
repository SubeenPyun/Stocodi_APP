// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) => HistoryModel(
      json['stock_name'] as String,
      DateTime.parse(json['transaction_date'] as String),
      $enumDecode(_$TransactionTypeEnumMap, json['transaction_type']),
      json['price'] as int,
      json['quantity'] as int,
    );

Map<String, dynamic> _$HistoryModelToJson(HistoryModel instance) =>
    <String, dynamic>{
      'stock_name': instance.stock_name,
      'transaction_date': instance.transaction_date.toIso8601String(),
      'transaction_type': _$TransactionTypeEnumMap[instance.transaction_type]!,
      'price': instance.price,
      'quantity': instance.quantity,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.PURCHASE: 'PURCHASE',
  TransactionType.SELL: 'SELL',
};
