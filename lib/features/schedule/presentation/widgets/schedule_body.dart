import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleBody extends StatelessWidget {
  const ScheduleBody({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const WeekCalendar(),
          const SizedBox(
            height: 16,
          ),
          ScheduleList(
            items: <Widget>[
              ScheduleEmptyItem(
                text: 'Номер группы: $groupNumber',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
