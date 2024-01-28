import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/schedule_empty_item.dart';
import 'package:flutter/material.dart';

/// A widget for convenient display of several lessons.
class ScheduleList extends StatelessWidget {
  const ScheduleList({
    super.key,
    this.items,
  });

  /// A list of widgets to display.
  final List<Widget>? items;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: items ?? _noItemsList(),
      ),
    );
  }

  /// The default element is displayed when there is no schedule.
  List<Widget> _noItemsList() {
    return <Widget>[const ScheduleEmptyItem(text: 'Выберите группу')];
  }
}
