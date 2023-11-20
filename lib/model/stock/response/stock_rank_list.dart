import 'package:json_annotation/json_annotation.dart';
import 'package:stocodi_app/model/stock/response/stock_rank.dart';

part 'stock_rank_list.g.dart';

@JsonSerializable()
class StockRankList {
  final List<StockRank> stock_rank_list;

  StockRankList(this.stock_rank_list);

  Map<String, dynamic> toJson() => _$StockRankListToJson(this);

  factory StockRankList.fromJson(Map<String, dynamic> json) =>
      _$StockRankListFromJson(json);
}

