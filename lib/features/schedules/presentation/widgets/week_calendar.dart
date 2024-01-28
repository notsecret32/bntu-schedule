import 'package:bntu_schedule/core/utils/utils.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:week_of_year/week_of_year.dart';

/// A composite widget that consists of two rows.
///
/// The first row contains the name of the month and the type of week.
///
/// In the second row there is a widget to select week day by week.
class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    super.key,
  });

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  /// Selected day of the week.
  DateTime _selectedDay = DateTime.now();

  /// The number of the week in the year.
  int _weekOfYear = DateTime.now().weekOfYear;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: <Widget>[
          /// ========== [Month + Week Type] ==========
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

          /// ========== [Spacer] ==========
          const SizedBox(
            height: 8,
          ),

          /// ========== [WeeklyDatePicker] ==========
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

  /// Returns the type of week depending on whether it is even or odd.
  int _getParityOfTheWeek() {
    return _weekOfYear % 2 == 0 ? 2 : 1;
  }

  /// Returns the name of the month depending on the week number.
  String _getMonthName() {
    // Get the `firstDayOfYear`.
    final DateTime firstDayOfYear = DateTime(DateTime.now().year);

    // Count the number of days from the beginning of the year
    // to the selected week number.
    final Duration daysFromStartOfYear = Duration(
      days: (_weekOfYear - 1) * 7,
    );

    // Calculates the current date by adding the number of days
    // to the beginning of the year.
    final DateTime targetDate = firstDayOfYear.add(daysFromStartOfYear);

    // Return the name of the month based on calculations.
    return months[targetDate.month - 1];
  }
}
