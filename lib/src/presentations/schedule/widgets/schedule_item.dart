import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// A widget that represents as a lesson.
///
/// It is used to display a lesson consisting of: name, type,
/// start and end time, teacher and classroom.
class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.title,
    required this.type,
    required this.time,
    required this.teacher,
    required this.classroom,
    this.isActive = false,
  });

  /// Lesson name.
  final String title;

  /// Lesson type.
  ///
  /// For example: Lecture, Practice & etc.
  final String type;

  /// Start & End time.
  final String time;

  /// The teacher or the one who will lead the class.
  final String teacher;

  /// An office or a place where the lesson will be held.
  final String classroom;

  /// Indicates whether this activity is currently underway or not.
  ///
  /// If the current time coincides with the interval of the lesson,
  /// then this is an active lesson.
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomContainer(
      isActive: isActive,
      elevationColor: Colors.transparent,
      inactiveColor: Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          /// ========== [Type + Time] ==========
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomToggleText(
                text: type,
                activeTextStyle: theme.textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.labelLarge!,
                isActive: isActive,
              ),
              CustomToggleText(
                text: time,
                activeTextStyle: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.bodySmall!,
                isActive: isActive,
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),

          /// ========== [Title] ==========
          Row(
            children: <Widget>[
              CustomToggleText(
                text: title,
                activeTextStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.bodyMedium!,
                isActive: isActive,
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),

          /// ========== [Teacher + Classroom] ==========
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomToggleText(
                text: teacher,
                activeTextStyle: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.bodySmall!,
                isActive: isActive,
              ),
              CustomToggleText(
                text: classroom,
                activeTextStyle: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.bodySmall!,
                isActive: isActive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
