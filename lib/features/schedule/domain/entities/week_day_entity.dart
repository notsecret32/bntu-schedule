import 'package:bntu_schedule/core/enums/enums.dart' show WeekDayEnum;
import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show LessonEntity;
import 'package:equatable/equatable.dart';

/// An alias for the [List] of type [LessonEntity].
typedef LessonEntityList = List<LessonEntity>;

/// An alias for [Map], where the key is [WeekDayEnum] and
/// the value is [LessonEntityList].
typedef LessonEntityListMap = Map<WeekDayEnum, LessonEntityList>;

/// An entity that represents an entire week, from Monday to Sunday.
class WeekDayEntity extends Equatable {
  const WeekDayEntity({
    required this.weekdays,
  });

  /// An object that stores the schedule for each day of the week.
  final LessonEntityListMap weekdays;

  /// Creates a new instance of [WeekDayEntity] with the same
  /// properties as this instance, but with the provided values.
  WeekDayEntity copyWith({
    LessonEntityListMap? weekdays,
  }) {
    return WeekDayEntity(
      weekdays: weekdays ?? this.weekdays,
    );
  }

  @override
  List<LessonEntityListMap> get props => <LessonEntityListMap>[weekdays];
}
