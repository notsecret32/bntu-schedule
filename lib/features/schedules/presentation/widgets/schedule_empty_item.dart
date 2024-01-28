import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// The widget is used in cases when there is no schedule.
///
/// This is possible when the user has not selected a group or because of some
/// unexpected error.
class ScheduleEmptyItem extends StatelessWidget {
  const ScheduleEmptyItem({
    super.key,
    required this.text,
  });

  /// Displayed text.
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CustomContainer(
      elevationColor: Colors.transparent,
      inactiveColor: Colors.transparent,
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
