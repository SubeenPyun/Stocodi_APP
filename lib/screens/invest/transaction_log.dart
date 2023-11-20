import 'package:flutter/material.dart';
import 'package:stocodi_app/invest/transaction_log/widget/custom_table_calendar.dart';
import 'package:stocodi_app/invest/transaction_log/widget/daily_transaction_log.dart';
import 'package:table_calendar/table_calendar.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_appbar.dart';
import '../utils.dart';

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
              CustomTableCalendar(
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  focusedDay: _focusedDay,
                  selectedDay: _selectedDay,
                  rangeStart: _rangeStart,
                  rangeEnd: _rangeEnd,
                  getEventsForDay: _getEventsForDay,
                  onDaySelected: _onDaySelected,
                  onRangeSelected: _onRangeSelected
              ),
              DailyTransactionLog(
                  selectedEvents: _selectedEvents,
                  calendarFormat: _calendarFormat,
                  rangeSelectionMode: _rangeSelectionMode,
                  focusedDay: _focusedDay,
                  selectedDay: _selectedDay,
                  rangeStart: _rangeStart,
                  rangeEnd: _rangeEnd,
                  getEventsForDay: _getEventsForDay,
                  onDaySelected: _onDaySelected,
                  onRangeSelected: _onRangeSelected
              )
            ],
          ),
        ),
      ),
    );
  }
}
