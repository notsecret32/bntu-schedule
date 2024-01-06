import 'package:flutter/material.dart';

String getMonth(BuildContext context, int month) {
  final List<String> months = <String>[
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  return months[month - 1];
}

extension CompareDates on DateTime {
  bool isSameDateAs(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  DateTime addDays(int days) {
    return DateTime(year, month, day + days);
  }
}
