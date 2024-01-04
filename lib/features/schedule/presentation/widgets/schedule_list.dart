import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Column(
        children: items,
      ),
    );
  }
}
