import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.type,
    required this.title,
    required this.teacher,
    required this.time,
    required this.classroom,
    this.isActive = false,
  });

  final String type;
  final String title;
  final String teacher;
  final String time;
  final String classroom;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BaseContainer(
      isActive: isActive,
      elevationColor: Colors.transparent,
      inactiveColor: Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ToggleText(
                text: type,
                activeTextStyle: theme.textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.labelLarge!,
                isActive: isActive,
              ),
              ToggleText(
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
          Row(
            children: <Widget>[
              ToggleText(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ToggleText(
                text: teacher,
                activeTextStyle: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
                inactiveTextStyle: theme.textTheme.bodySmall!,
                isActive: isActive,
              ),
              ToggleText(
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
