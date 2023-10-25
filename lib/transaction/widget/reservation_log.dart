import 'package:flutter/material.dart';
import 'package:stocodi_app/lecture/Item/CommentItem.dart';
import 'package:stocodi_app/lecture/widget/MyComment.dart';
import 'package:stocodi_app/transaction/item/reservation_item.dart';

class ReservationLog extends StatelessWidget {
  const ReservationLog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 스크롤을 막음
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ReservationItem(
                    perPrice: 240000,
                    stock: "애플",
                    day: "9월 11일",
                    buy: 1,
                    howmuch: 7,
                  );
                } else if (index == 1) {
                  return ReservationItem(
                    perPrice: 330000,
                    stock: "테슬라",
                    day: "9월 10일",
                    buy: 1,
                    howmuch: 10,
                  );
                } else if (index == 2) {
                  return ReservationItem(
                    perPrice: 1021000,
                    stock: "에코프로",
                    day: "9월 9일",
                    buy: 0,
                    howmuch: 1,
                  );
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
