import 'package:stocodi_app/model/portfolio/response/portfolio_response.dart';

import '../../../API/retrofit/auth_manager.dart';

class UpdatePortfolio {
  late List<PortfoiloResponse>? portfoliolist;

  Future<List<PortfoiloResponse>?> updatePortfolio() async {
    try {
      final authenticationManager = AuthenticationManager();

      portfoliolist = await authenticationManager.getPortfolio();
      /*if (portfoliolist != null) {
        List<String> valueList = [];
        Map<String, int> price = {};
        Map<String, int> profits = {}; //unrealized_gain 맵 추가
        Map<String, double> cumulativeReturns = {}; //cumulative_returns 맵 추가
        for (var response in portfoliolist!) {
          var account = response.account; // 자산 정보에 접근
          var histories = response.histories; // 거래 기록 목록에 접근
          var stockHoldings = response.stock_holdings; // 보유 종목 목록에 접근
          var stockHoldingRates =
              response.stock_holding_rates; // 보유 종목 등락 목록에 접근

          //각 AccountModel의 정보를 valueList에 추가
          valueList.add(account.account_name); //각 포트폴리오 계좌 이름
          price[account.account_name] = account.remain_cash;
          profits[account.account_name] = account.unrealized_gain;
          cumulativeReturns[account.account_name] = account.cumulative_returns;
          print("이상하다!!! 리스트는?? ${account.account_name}");
        }

        print('Value 리스트 : $valueList');
        print('Price 맵 : $price');
        print('Profit 맵 : $profits');
        print('cumulative_returns 맵 : $cumulativeReturns');
      }*/
      return portfoliolist;
    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
    return null;
  }
}
