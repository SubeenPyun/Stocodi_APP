import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/round_square_container.dart';
import '../item/transaction_log_item.dart';
import '../utils.dart';

final ThemeData theme = AppTheme.appTheme;

class DailyTransactionLog extends StatefulWidget {
  final ValueNotifier<List<Event>> selectedEvents;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final List<Event>Function(DateTime) getEventsForDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime?, DateTime?, DateTime) onRangeSelected;

  DailyTransactionLog({
    super.key,
    required this.selectedEvents,
    required this.calendarFormat,
    required this.rangeSelectionMode,
    required this.focusedDay,
    required this.selectedDay,
    required this.rangeStart,
    required this.rangeEnd,
    required this.getEventsForDay,
    required this.onDaySelected,
    required this.onRangeSelected,
  });

  @override
  _DailyTransactionLogState createState() => _DailyTransactionLogState();
}


class _DailyTransactionLogState extends State<DailyTransactionLog> {

  @override
  Widget build(BuildContext context) {
    Widget buildTransactionLogItem(String image, String title, int share,
        int price) {
      return TransactionLogDetailItem(
        image: image,
        title: title,
        share: share,
        price: price,
        onPressed: () {},
      );
    }

    String formattedSelectedDate = widget.selectedDay != null
        ? "${widget.selectedDay!.month}월 ${widget.selectedDay!.day}일"
        : "날짜를 선택하세요"; // 선택한 날짜를 표시

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double containerHeight = MediaQuery
            .of(context)
            .size
            .height;
        double remainingHeight = containerHeight * 0.24; // 내부 이미지의 폭을 조절

        if (widget.selectedEvents.value.length > 1) {
          remainingHeight = widget.selectedEvents.value.length * 90 + 90;
        }

        return RoundSquareContainer(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: remainingHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      formattedSelectedDate,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(width: 6), // 숫자와의 간격 조절
                    ValueListenableBuilder<List<Event>>(
                      valueListenable: widget.selectedEvents,
                      builder: (context, value, _) {
                        int eventCount = value.length;
                        return Stack(
                          children: [
                            Container(
                              width: 26, // 동그란 원의 지름
                              height: 26, // 동그란 원의 지름
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE7FBF3), // 원의 색상
                              ),
                              child: Center(
                                child: Text(
                                  eventCount.toString(),
                                  style: theme.textTheme.titleSmall?.copyWith(
                                      color: theme.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder<List<Event>>(
                valueListenable: widget.selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return buildTransactionLogItem("apple", "애플", 10,
                              124000);
                        case 1:
                          return buildTransactionLogItem("teslr", "테슬라", 10,
                              124000);
                        case 2:
                          return buildTransactionLogItem("ecopro", "에코프로", 10,
                              -124000);
                        default:
                          return SizedBox.shrink();
                      }
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}