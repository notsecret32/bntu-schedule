import 'package:bntu_schedule/core/enums/week_day_enum.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/lesson_entity.dart';
import 'package:equatable/equatable.dart';

/// An entity that stores a schedule for each day of the week
/// for a specific group.
class GroupScheduleEntity extends Equatable {
  const GroupScheduleEntity({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  final List<LessonEntity>? monday;
  final List<LessonEntity>? tuesday;
  final List<LessonEntity>? wednesday;
  final List<LessonEntity>? thursday;
  final List<LessonEntity>? friday;
  final List<LessonEntity>? saturday;
  final List<LessonEntity>? sunday;

  /// Operator overload for convenient operation with this class.
  ///
  /// Returns an object from this class of type [List].
  ///
  /// For example:
  ///
  /// ```dart
  /// // Some kind of schedule for the group
  /// final schedule = GroupScheduleEntity(...);
  ///
  /// // schedule[WeekDayEnum.monday] == schedule.monday
  /// final mondaySchedule = schedule[WeekDayEnum.monday];
  ///
  /// print(mondaySchedule.runtimeType); // List<LessonEntity>?
  /// ```
  List<LessonEntity>? operator [](WeekDayEnum weekday) {
    switch (weekday) {
      case WeekDayEnum.monday:
        return monday;
      case WeekDayEnum.tuesday:
        return tuesday;
      case WeekDayEnum.wednesday:
        return wednesday;
      case WeekDayEnum.thursday:
        return thursday;
      case WeekDayEnum.friday:
        return friday;
      case WeekDayEnum.saturday:
        return saturday;
      case WeekDayEnum.sunday:
        return sunday;
    }
  }

  @override
  List<Object?> get props => <Object?>[
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
      ];
}
