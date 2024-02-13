import 'package:bntu_schedule/core/enums/week_day_enum.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/lesson_entity.dart';
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
    final List<LessonEntity>? weekDaySchedule = schedule[weekday];
    return weekDaySchedule == null
        ? ScheduleViewer.empty()
        : ListView.separated(
            itemCount: weekDaySchedule.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              if (weekDaySchedule[index].excludeWeekType != null &&
                  weekDaySchedule[index].excludeWeekType == weekType) {
                return Container();
              }

              return LessonItem(
                lesson: weekDaySchedule[index],
                weekType: weekType,
              );
            },
          );
  }
}
