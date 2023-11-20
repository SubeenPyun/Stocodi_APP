import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../theme/app_theme.dart';
import '../../../../widgets/round_square_container.dart';
import '../utils.dart';

final ThemeData theme = AppTheme.appTheme;

class CustomTableCalendar extends StatefulWidget {
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final DateTime? rangeStart;
  final DateTime? rangeEnd;
  final List<Event>Function(DateTime) getEventsForDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime?, DateTime?, DateTime) onRangeSelected;

  CustomTableCalendar({
    super.key,
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
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}


class _CustomTableCalendarState extends State<CustomTableCalendar> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double deviceWidth = MediaQuery.of(context).size.width;
        double widthRatio = 342 / 390;
        double containerWidth = deviceWidth * widthRatio;
        double heightRatio = 485/342;
        double containerHeight = containerWidth*heightRatio;

        return RoundSquareContainer(
          width : MediaQuery.of(context).size.width,
          height: containerHeight,
          child: TableCalendar<Event>(
            locale: 'ko_KR',
            focusedDay: widget.focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            headerStyle: HeaderStyle(
              headerMargin: EdgeInsets.only(bottom: 30),
              leftChevronVisible: false,
              rightChevronVisible: false,
              formatButtonVisible: false,
              titleTextStyle: theme.textTheme.titleMedium!,
              titleTextFormatter: (date, locale){
                return '${DateFormat.M(locale).format(date)}, ${DateFormat.y(locale).format(date)}';
              },
            ),
            selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
            rangeStartDay: widget.rangeStart,
            rangeEndDay: widget.rangeEnd,
            calendarFormat: widget.calendarFormat,
            rangeSelectionMode: widget.rangeSelectionMode,
            eventLoader: widget.getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              canMarkersOverflow: false,
              markersAutoAligned: true,
              markersMaxCount: 4, // 이벤트 개수와 점 개수 다르게 + 최대 점 개수 2개로 수정 필요
              markerDecoration: BoxDecoration(
                color: Colors.red, // 이벤트 내용에 따라 수정 필요
                shape: BoxShape.circle,
              ),
              isTodayHighlighted: true,
              todayTextStyle: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700,color: theme.primaryColor),
              todayDecoration: BoxDecoration(
                color: Colors.white
              ),
              selectedTextStyle: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700,color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            onDaySelected: widget.onDaySelected,
            onRangeSelected: widget.onRangeSelected,
            onPageChanged: (focusedDay) {
              focusedDay = focusedDay;
            },
          ),
        );
      }
    );
  }
}