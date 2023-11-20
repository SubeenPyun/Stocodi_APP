import 'package:json_annotation/json_annotation.dart';

// 터미널 명령어 -> flutter pub run build_runner build
part 'stock_rank.g.dart'; // 현재 파일 이름과 같아야 함!!!

@JsonSerializable()
class StockRank {
  final int rank;
  final String stock_code;
  final String stock_name;
  final int current_price;
  final int volume;

  StockRank(this.rank, this.stock_code, this.stock_name, this.current_price,
      this.volume);

  Map<String, dynamic> toJson() => _$StockRankToJson(this);

  // JSON 역직렬화를 위한 팩토리 생성자
  factory StockRank.fromJson(Map<String, dynamic> json) =>
      _$StockRankFromJson(json);
}

