import 'package:flutter/material.dart';
import 'package:stocodi_app/model/portfolio/response/portfolio_response.dart';
import '../../../home/data/updatePortfolio.dart';

class PortfolioData extends ChangeNotifier {
  List<PortfoiloResponse>? portfolioList = []; // 포트폴리오 리스트
  late PortfoiloResponse selectedPortfolio;
  late UpdatePortfolio updatePortfolio;
  bool isSelected = false;

  PortfolioData() {
    updatePortfolio = UpdatePortfolio();
  }

  void loadPortfolioData() async {
    try {
      await updatePortfolio.updatePortfolio();

      if (updatePortfolio.portfoliolist != null &&
          updatePortfolio.portfoliolist!.isNotEmpty) {
        portfolioList = updatePortfolio.portfoliolist;

        if (!isSelected) {
          selectedPortfolio = portfolioList![0];
          isSelected = true;
          //print("처음으로 선택한 것!! >> ${selectedPortfolio.account.account_name}");
        } else {
          var foundPortfolio = portfolioList!.firstWhere(
              (portfolio) =>
                  portfolio.account.account_name ==
                  selectedPortfolio.account.account_name,
              orElse: () => portfolioList![0]);

          selectedPortfolio = foundPortfolio;
        }
      } else {
        portfolioList = [];
        isSelected = false;
      }

      notifyListeners();
    } catch (e) {
      print("공유 데이터 로딩 중 오류가 발생했습니다.: $e");
      portfolioList = [];
      notifyListeners();
    }
  }

  void updateSelected(PortfoiloResponse newData) {
    if (portfolioList!.contains(newData)) {
      selectedPortfolio = newData;
      isSelected = true;
      notifyListeners();
    } else {
      print("포트폴리오가 리스트 안에 존재하지 않습니다.");
      // 선택한 포트폴리오가 리스트 안에 없는 경우 처리할 작업을 여기에 추가하세요.
    }
  }
}
