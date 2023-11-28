import 'package:flutter/material.dart';
import 'package:stocodi_app/widgets/round_square_container.dart';

class GridItem extends StatelessWidget {
  BuildContext context;
  String title;
  Widget? childWidget, destinationPage;

  GridItem({
    super.key,
    required this.context,
    required this.title,
    required this.childWidget,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double widthRatio = 164 / 390;
    double containerWidth = deviceWidth * widthRatio;

    return GestureDetector(
      onTap: () {
         if (destinationPage != null) {
           Navigator.push(
             context,
              MaterialPageRoute(
                builder: (context) => destinationPage!,
              ),
           );
        }
      },
      child: RoundSquareContainer(
        width: containerWidth,
        child: childWidget ?? Container(), // childWidget null이면 빈 컨테이너
      ),
    );
  }
}
