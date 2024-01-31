import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SchedulesView extends StatelessWidget {
  const SchedulesView({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SchedulesHeader(),
      body: SchedulesBody(groupNumber: groupNumber),
    );
  }
}
