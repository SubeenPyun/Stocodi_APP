import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/Invest_experiment/data/interest_item_data.dart';
import 'package:stocodi_app/invest/Invest_experiment/item/interest_item.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../../../widgets/round_square_container.dart';

class InterestItemsList extends StatelessWidget {
  final ThemeData theme = AppTheme.appTheme;
  final List<InterestItemData> investmentItems;

  InterestItemsList({
    Key? key,
    required this.investmentItems,
  }) : super(key: key);

  List<Widget> _buildInterestItems() {
    return investmentItems.map((item) {
      return InterestItem(
        image: item.image,
        title: item.title,
        price: item.price,
        percentage: item.percentage,
        onPressed: () {},
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundSquareContainer(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "관심종목",
                textAlign: TextAlign.left,
                style: theme.textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: _buildInterestItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
