import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// A widget for convenient display of several lessons.
class ScheduleList extends StatelessWidget {
  const ScheduleList({
    super.key,
    required this.items,
  });

  /// A list of widgets to display.
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: items,
      ),
    );
  }
}
