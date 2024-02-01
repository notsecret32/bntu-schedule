import 'package:bntu_schedule/core/enums/enums.dart'
    show WeekTypesEnum, WeekDayEnum;
import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show LessonEntity, GroupScheduleEntity;
import 'package:equatable/equatable.dart';

/// The alias consists of a Map, where the key is the group number, and the
/// value is the schedule for this group.
typedef ScheduleGroupMap = Map<String, GroupScheduleEntity>;

/// An entity that stores a schedule at the group level.
class ScheduleEntity extends Equatable {
  const ScheduleEntity({
    required this.groupNumber,
  });

  /// The key by which the schedule for this group will be stored.
  ///
  /// ```dart
  /// final schedules = ScheduleEntity(
  ///   groupNumber: {
  ///    '10701421': ScheduleGroupEntity(...),
  ///    '80213651': ScheduleGroupEntity(...),
  ///    '68132089': ScheduleGroupEntity(...),
  ///   },
  /// );
  /// ```
  final ScheduleGroupMap groupNumber;

  /// A method for conveniently obtaining a schedule for a specific
  /// day of the week.
  ///
  /// The schedule is taken for the group [groupNumber],
  /// with the week type [weekType], for the day of the week [weekday].
  List<LessonEntity>? getScheduleByWeekday({
    required String groupNumber,
    required WeekTypesEnum weekType,
    required WeekDayEnum weekday,
  }) {
    return this.groupNumber[groupNumber]?.weeks[weekType]?.weekdays[weekday];
  }

  /// Creates a new instance of [ScheduleEntity] with the same
  /// properties as this instance, but with the provided values.
  ScheduleEntity copyWith({
    ScheduleGroupMap? groupNumber,
  }) {
    return ScheduleEntity(
      groupNumber: groupNumber ?? this.groupNumber,
    );
  }

  @override
  List<ScheduleGroupMap> get props => <ScheduleGroupMap>[
        groupNumber,
      ];
}
