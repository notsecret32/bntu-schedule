import 'package:bntu_schedule/core/widgets/custom_container.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/lesson_entity.dart';
import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({
    super.key,
    required this.lesson,
    required this.weekType,
  });

  final LessonEntity lesson;
  final int weekType;

  static Widget empty(String text, [TextStyle? style]) {
    return CustomContainer(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle labelLargeTextStyle = textTheme.labelLarge!;
    final TextStyle bodyMediumTextStyle = textTheme.bodyMedium!;
    final TextStyle bodySmallTextStyle = textTheme.bodySmall!;

    return CustomContainer(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Column(
        children: <Widget>[
          /// ========== [Type & Time] ==========
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _buildTypeText(),
                  style: labelLargeTextStyle,
                ),
                Text(
                  lesson.timeToString(),
                  style: bodySmallTextStyle,
                ),
              ],
            ),
          ),

          /// ========== [Name] ==========
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            alignment: Alignment.centerLeft,
            child: Text(
              lesson.getName(),
              style: bodyMediumTextStyle,
            ),
          ),

          /// ========== [Teacher & Classroom] ==========
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  lesson.getTeacher().getFullName(),
                  style: bodySmallTextStyle,
                ),
                Text(
                  lesson.classroom,
                  style: bodySmallTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _buildTypeText() {
    if (lesson.weekType == 0) {
      return lesson.getType();
    }

    switch (lesson.weekType) {
      case 1:
        return weekType == 1
            ? '${lesson.getType()} (1)'
            : '${lesson.getType()} (2)';
      case 2:
        return weekType == 1
            ? '${lesson.getType()} (2)'
            : '${lesson.getType()} (1)';
      default:
        throw Exception('Invalid week type');
    }
  }
}
