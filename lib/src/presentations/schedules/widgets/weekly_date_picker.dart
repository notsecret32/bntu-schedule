import 'package:bntu_schedule/src/core/utils/compare_dates.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:week_of_year/week_of_year.dart';

/// Widget for selecting the day of the week in vertical scroll format.
class WeeklyDatePicker extends StatefulWidget {
  const WeeklyDatePicker({
    super.key,
    required this.selectedDay,
    required this.onChangeDay,
    this.weekDays = const <String>[
      'ПН',
      'ВТ',
      'СР',
      'ЧТ',
      'ПТ',
      'СБ',
      'ВС',
    ],
    this.daysInWeek = 7,
    required this.unselectedTextStyle,
    required this.selectedTextStyle,
    required this.backgroundColor,
    this.onSwipe,
  }) : assert(
          weekDays.length == daysInWeek,
          'weekdays must be of length $daysInWeek',
        );

  ///
  final DateTime selectedDay;
  final List<String> weekDays;
  final int daysInWeek;

  final Function(DateTime selectedDate) onChangeDay;
  final Function(int weekOfYear)? onSwipe;

  final Color backgroundColor;
  final TextStyle unselectedTextStyle;
  final TextStyle selectedTextStyle;

  @override
  State<WeeklyDatePicker> createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  /// About 1 years back in time should be sufficient for most users, 52 weeks
  final int _weekIndexOffset = 52;

  /// The [PageController] of the weeks pages so that they can be changed.
  late final PageController _controller;

  /// The initial selected day.
  late final DateTime _initialSelectedDay;

  /// The number of the week in the year from the selected day.
  int _weekOfYear = 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _weekIndexOffset);
    _initialSelectedDay = widget.selectedDay;
    _weekOfYear = widget.selectedDay.weekOfYear;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: Row(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  _weekOfYear = _initialSelectedDay
                      .addDays(7 * (index - _weekIndexOffset))
                      .weekOfYear;

                  widget.onSwipe!(_weekOfYear);
                });
              },
              itemBuilder: (_, int weekIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _weekdays(weekIndex - _weekIndexOffset),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// A method that builds a week depending on the number of days in a week.
  ///
  /// The number of days per week is specified in the `daysInWeek` parameter.
  List<Widget> _weekdays(int weekIndex) {
    final List<Widget> weekdays = <Widget>[];

    for (int i = 0; i < widget.daysInWeek; i++) {
      final int offset = i + 1 - _initialSelectedDay.weekday;
      final int daysToAdd = weekIndex * 7 + offset;
      final DateTime dateTime = _initialSelectedDay.addDays(daysToAdd);
      weekdays.add(_dateButton(dateTime));
    }

    return weekdays;
  }

  /// The method that builds the button that the widget consists of.
  Widget _dateButton(DateTime dateTime) {
    final String weekday = widget.weekDays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDateAs(widget.selectedDay);

    return GestureDetector(
      onTap: () => widget.onChangeDay(dateTime),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: isSelected ? widget.backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomToggleText(
              text: weekday,
              isActive: isSelected,
              activeTextStyle: widget.selectedTextStyle,
              inactiveTextStyle: widget.unselectedTextStyle,
            ),
            CustomToggleText(
              text: '${dateTime.day}',
              isActive: isSelected,
              activeTextStyle: widget.selectedTextStyle,
              inactiveTextStyle: widget.unselectedTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
