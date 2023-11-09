import 'package:json_annotation/json_annotation.dart';
import 'package:stocodi_app/model/stockDTO/response/stock.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'stock_list.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class StockList{
  final List<Stock> stockList;

  StockList(this.stockList);

  Map<String, dynamic> toJson() => _$StockListToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory StockList.fromJson(Map<String, dynamic> json) =>
      _$StockListFromJson(json);
}

