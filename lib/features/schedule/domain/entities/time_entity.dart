import 'package:equatable/equatable.dart';

/// An entity representing the start and end of the lesson.
class TimeEntity extends Equatable {
  const TimeEntity({
    required this.start,
    required this.end,
  });

  /// The beginning of the lesson.
  final DateTime start;

  /// The end of the lesson.
  final DateTime end;

  /// Creates a new instance of [TimeEntity] with the same
  /// properties as this instance, but with the provided values.
  TimeEntity copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return TimeEntity(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  List<DateTime> get props => <DateTime>[
        start,
        end,
      ];
}
