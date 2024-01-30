import 'package:bntu_schedule/features/schedules/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({
    super.key,
    required this.groupNumber,
  });

  /// The group number obtained from the path parameters.
  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return SchedulesView(groupNumber: groupNumber);
  }
}
