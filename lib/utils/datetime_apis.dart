import 'package:bntu_schedule/generated/l10n.dart';
import 'package:flutter/material.dart';

String getMonth(BuildContext context, int month) {
  final List<String> months = <String>[
    S.of(context).january,
    S.of(context).february,
    S.of(context).march,
    S.of(context).april,
    S.of(context).may,
    S.of(context).june,
    S.of(context).july,
    S.of(context).august,
    S.of(context).september,
    S.of(context).october,
    S.of(context).november,
    S.of(context).december,
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
