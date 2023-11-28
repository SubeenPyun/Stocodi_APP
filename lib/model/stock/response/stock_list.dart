import 'package:json_annotation/json_annotation.dart';
import 'package:stocodi_app/model/stock/response/stock.dart';

part 'stock_list.g.dart';

@JsonSerializable()
class StockList{
  final List<Stock> stock_list;

  StockList(this.stock_list);

  Map<String, dynamic> toJson() => _$StockListToJson(this);

  factory StockList.fromJson(Map<String, dynamic> json) =>
      _$StockListFromJson(json);
}

