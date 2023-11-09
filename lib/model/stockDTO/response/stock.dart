import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'stock.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class Stock{
  final String stock_code;
  final String stock_name;


  Stock(this.stock_code, this.stock_name);

  Map<String, dynamic> toJson() => _$StockToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory Stock.fromJson(Map<String, dynamic> json) =>
      _$StockFromJson(json);
}

