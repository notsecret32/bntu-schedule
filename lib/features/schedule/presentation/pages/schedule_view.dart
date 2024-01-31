import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScheduleHeader(),
      body: ScheduleBody(groupNumber: groupNumber),
    );
  }
}
