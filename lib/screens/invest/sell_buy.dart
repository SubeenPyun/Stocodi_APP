import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/sell_buy_buttons.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/stock_custom_appbar.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/stock_info.dart';
import 'package:stocodi_app/screens/invest/sellbuy/widget/stock_tab_bar.dart';
import 'dart:async';
import 'package:stocodi_app/API/web_socket/stock_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../model/auth/request/login_model.dart';
import '../../model/stock/request/interest_stock.dart';
import '../../model/stock/socket_connect.dart';
import '../../model/stock/response/stock.dart';
import 'package:stocodi_app/api/retrofit/auth_manager.dart';

class SellBuy extends StatefulWidget{
  final StockInfo stockInfo;

  const SellBuy({
    Key? key,
    required this.stockInfo,
  }) : super(key: key);

  @override
  _SellBuyState createState() => _SellBuyState();
}

class _SellBuyState extends State<SellBuy> {
  // final channel = IOWebSocketChannel.connect('ws://10.0.2.2:53001/api/ws/stock'); // 소켓 연결
  final url =  Uri.parse('ws://10.0.2.2:53001/api/ws/stock');
  late WebSocketChannel channel; // 소켓 연결

  StreamController<String> _messageController =
  StreamController<String>.broadcast();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _initializeWebSocket();
  }

  void _initializeWebSocket() async {
    channel = WebSocketChannel.connect(url);
    channel.stream.listen((event) {
      _messageController.add(event);
    });
  }

  Future<void> registerInterest() async {
    final loginData = LoginRequest(
        email: 'kimye702@naver.com',
        password: 'kim111111@'
    );

    Stock stock=new Stock("", "");

    try {

      // 인증 api 확인
      final authenticationManager = AuthenticationManager();
      await authenticationManager.login(loginData);

      // 주식 api 확인
      final stockManager = StockManager();
      final response = await stockManager.checkSocketConnection(); // 소켓 룸 생성
      final socketData = SocketConnect(response?.data['response']);
      print(socketData.toJson());
      // StreamController<String> _messageController;
      // 에뮬레이터용 웹소켓 서버 url
      channel = WebSocketChannel.connect(url);

      await Future.delayed(Duration(milliseconds: 500));

      channel.sink.add(socketData.toJson()); // 소켓으로 세션 전송 (룸 생성 시 받은 id값 json으로)

      stock = await stockManager.getStockCode(widget.stockInfo.title);

      final interestData1 = InterestStock(
        'kimye702@naver.com',
        stock.stock_code,
      );

      await stockManager.registerInterestStock(interestData1);
      print(widget.stockInfo.title);

    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
  }

  // 상태 클래스가 종료될 때 호출
  @override
  void dispose() {
    // 채널을 닫음
    channel.sink.close();
    _messageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: StockCustomAppBar(
        title: widget.stockInfo.title,
        preferredHeight: 64,
        onPressed: registerInterest,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            StockInfo(
              title: widget.stockInfo.title,
              price: widget.stockInfo.price,
              changeValue: widget.stockInfo.changeValue,
              changePercentage: widget.stockInfo.changePercentage,
              code: widget.stockInfo.code
            ),
            StockTabBar(currentPrice: widget.stockInfo.price,scaffoldKey: _scaffoldKey,),
            SellBuyButtons(),
          ],
        ),
      ),
    );
  }
}
