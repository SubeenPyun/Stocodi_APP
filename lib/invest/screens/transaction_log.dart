import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stocodi_app/invest/item/transaction_log_item.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../theme/app_theme.dart';
import '../../widgets/custom_appbar.dart';
import '../../utils.dart';
import '../../widgets/round_square_container.dart';

final ThemeData theme = AppTheme.appTheme;

class TransactionLog extends StatefulWidget{
  const TransactionLog({Key? key}) : super(key: key);

  @override
  _TransactionLogState createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  Widget _buildTableCalendarSection(BuildContext context){
    return RoundSquareContainer(
      width : MediaQuery.of(context).size.width,
      height: 440,
      child: TableCalendar<Event>(
        locale: 'ko_KR',
        focusedDay: _focusedDay,
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
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,
        eventLoader: _getEventsForDay,
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
        onDaySelected: _onDaySelected,
        onRangeSelected: _onRangeSelected,
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }

  Widget _buildDailyTransactionLogSection(BuildContext context){

    Widget buildTransactionLogItem(String image, String title, int share, int price) {
      return TransactionLogDetailItem(
        image: image,
        title: title,
        share: share,
        price: price,
        onPressed: () {},
      );
    }

    String formattedSelectedDate = _selectedDay != null
      ? "${_selectedDay!.month}월 ${_selectedDay!.day}일"
      : "날짜를 선택하세요"; // 선택한 날짜를 표시

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double remainingHeight = constraints.maxHeight;
        if (_selectedEvents.value.length > 0) {
          // 이벤트가 있는 경우, 이벤트 항목 높이 + 추가 여백 (90은 임의로 선택한 높이입니다)
          remainingHeight = _selectedEvents.value.length * 90 + 90;
        }

        return RoundSquareContainer(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: _selectedEvents.value.length == 0 ? MediaQuery
              .of(context)
              .size
              .height - 400 : _selectedEvents.value.length * 90 + 90,
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
                      valueListenable: _selectedEvents,
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
                valueListenable: _selectedEvents,
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

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        preferredHeight: 64,
        title: "거래일지",
        onSearchPressed: (){},
        showSearchIcon: false,
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Container(
          color: theme.backgroundColor,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTableCalendarSection(context),
              _buildDailyTransactionLogSection(context),
              // 캘린더에 아무 이벤트도 없을 때 빈공간 발생 -> 색이 다름 수정 필요
            ],
          ),
        ),
      ),
    );
  }
}
