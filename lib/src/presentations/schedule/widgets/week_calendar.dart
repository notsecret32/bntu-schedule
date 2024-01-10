import 'package:bntu_schedule/src/core/utils/utils.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:bntu_schedule/src/presentations/schedule/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:week_of_year/week_of_year.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    super.key,
  });

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  DateTime _selectedDay = DateTime.now();
  int _weekOfYear = DateTime.now().weekOfYear;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BaseContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _getMonthName(),
                  style: theme.textTheme.labelMedium,
                ),
                Text(
                  'Неделя №${_getParityOfTheWeek()}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          WeeklyDatePicker(
            selectedDay: _selectedDay,
            backgroundColor: theme.primaryColor,
            selectedTextStyle: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            unselectedTextStyle: theme.textTheme.bodyMedium!,
            onChangeDay: (DateTime value) => setState(() {
              _selectedDay = value;
            }),
            onSwipe: (int weekOfYear) => setState(() {
              _weekOfYear = weekOfYear;
            }),
          ),
        ],
      ),
    );
  }

  int _getParityOfTheWeek() {
    return _weekOfYear % 2 == 0 ? 2 : 1;
  }

  String _getMonthName() {
    final DateTime firstDayOfYear = DateTime(DateTime.now().year);

    final Duration daysFromStartOfYear = Duration(
      days: (_weekOfYear - 1) * 7,
    );

    final DateTime targetDate = firstDayOfYear.add(daysFromStartOfYear);

    return getMonth(context, targetDate.month);
  }
}
