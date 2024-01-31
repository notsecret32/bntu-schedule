import 'package:bntu_schedule/features/schedule/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    super.key,
    required this.groupNumber,
  });

  /// The group number obtained from the path parameters.
  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return ScheduleView(groupNumber: groupNumber);
  }
}
