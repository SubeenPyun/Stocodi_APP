import 'package:flutter/material.dart';
import 'package:stocodi_app/widgets/custom_appbar.dart';
import '../../../../theme/app_theme.dart';
import 'Invest_experiment/data/interest_item_data_manager.dart';
import 'Invest_experiment/widget/interest_items_list.dart';
import 'Invest_experiment/widget/portfolio_section.dart';

final ThemeData theme = AppTheme.appTheme;

class InvestExperiment extends StatelessWidget {
  const InvestExperiment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final investmentItems = InterestItemDataManager.investmentItems;

    return Scaffold(
      appBar: CustomAppBar(
        preferredHeight: 64,
        title: "투자실험",
        onSearchPressed: () {},
        showSearchIcon: true,
      ),
      body: Container(
        color: theme.backgroundColor,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PortfolioSection(),
            InterestItemsList(
              investmentItems: investmentItems,
              context: context,
            ),

          ],
        ),
      ),
    );
  }
}
