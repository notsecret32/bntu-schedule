import 'package:bntu_schedule/core/enums/week_day_enum.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/lesson_entity.dart';
import 'package:custom_widgets/extensions.dart' show CustomListView;
import 'package:flutter/material.dart';

import './lesson_item.dart';

class ScheduleViewer extends StatelessWidget {
  const ScheduleViewer({
    super.key,
    required this.schedule,
    required this.weekday,
    required this.weekType,
  });

  final GroupScheduleEntity schedule;
  final WeekDayEnum weekday;
  final int weekType;

  static Widget empty() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) =>
          LessonItem.empty('На данный день нет расписания'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<LessonEntity>? weekdaySchedule = schedule[weekday];

    return CustomListView.separated(
      enable: weekdaySchedule != null,
      itemCount: weekdaySchedule!.length,
      condition: (_, int index) => _isThisAnExceptionalWeek(
        weekdaySchedule,
        index,
      ),
      itemBuilder: (_, int index) => LessonItem(
        lesson: weekdaySchedule[index],
        weekType: weekType,
      ),
      separatorBuilder: (_, __) => const SizedBox(
        height: 8,
      ),
    );
  }

  bool _isThisAnExceptionalWeek(
    List<LessonEntity> weekDaySchedule,
    int index,
  ) {
    return weekDaySchedule[index].excludeWeekType != null &&
            weekDaySchedule[index].excludeWeekType == weekType
        ? true
        : false;
  }
}
