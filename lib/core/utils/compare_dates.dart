/// List of months in Russian.
const List<String> months = <String>[
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

/// An extension for an existing [DateTime] class
extension CompareDates on DateTime {
  /// Compares two dates by year, month and day.
  bool isSameDateAs(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  /// Adds days to an already existing [DateTime] object.
  DateTime addDays(int days) {
    return DateTime(year, month, day + days);
  }
}
