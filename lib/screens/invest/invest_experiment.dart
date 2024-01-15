import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocodi_app/screens/invest/Invest_experiment/search.dart';
import 'package:stocodi_app/model/portfolio/portfolio_data.dart';
import 'package:stocodi_app/widgets/custom_appbar.dart';
import '../../../../theme/app_theme.dart';
import 'Invest_experiment/data/interest_item_data_manager.dart';
import 'Invest_experiment/widget/interest_items_list.dart';
import 'Invest_experiment/widget/portfolio_section.dart';

final ThemeData theme = AppTheme.appTheme;

class InvestExperiment extends StatefulWidget {
  const InvestExperiment({Key? key}) : super(key: key);

  @override
  State<InvestExperiment> createState() => _InvestExperimentState();
}

class _InvestExperimentState extends State<InvestExperiment> {
  late PortfolioData portfolioData;

  @override
  void initState() {
    portfolioData = Provider.of<PortfolioData>(context, listen: false);
    portfolioData.loadPortfolioData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final investmentItems = InterestItemDataManager.investmentItems;

    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            preferredHeight: 64,
            title: "투자실험",
            onSearchPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            showSearchIcon: true,
          ),
          body: Container(
            color: theme.colorScheme.background,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                PortfolioSection(),
                InterestItemsList(
                  investmentItems: investmentItems,
                  context: context,
                ),
                InterestItemsList(
                  investmentItems: investmentItems,
                  context: context,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            child: Center(
              child: Text(
                "현재 서비스 준비중입니다",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
