import 'package:bntu_schedule/core/enums/enums.dart' show WeekTypesEnum;
import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show WeekDayEntity;
import 'package:equatable/equatable.dart';

/// An alias of the [Map] type, where the key is [WeekTypesEnum] and
/// the value is [WeekDayEntity].
typedef WeekTypesMap = Map<WeekTypesEnum, WeekDayEntity>;

/// An entity that stores a schedule for each type of week per group.
class GroupScheduleEntity extends Equatable {
  const GroupScheduleEntity({
    required this.weeks,
  });

  /// An object that stores a schedule for certain types of weeks.
  ///
  /// ```dart
  /// final schedules = ScheduleEntity(
  ///   groupNumber: {
  ///    '10701421': GroupScheduleEntity(
  ///       weekdays: WeekDayEntity(...),
  ///     ),
  ///   },
  /// );
  /// ```
  final WeekTypesMap weeks;

  /// Creates a new instance of [GroupScheduleEntity] with the same
  /// properties as this instance, but with the provided values.
  GroupScheduleEntity copyWith({
    WeekTypesMap? weeks,
  }) {
    return GroupScheduleEntity(weeks: weeks ?? this.weeks);
  }

  @override
  List<WeekTypesMap> get props => <WeekTypesMap>[weeks];
}
