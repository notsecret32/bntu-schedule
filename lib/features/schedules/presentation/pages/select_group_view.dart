import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectGroupView extends StatelessWidget {
  const SelectGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Выбор группы',
      ),
      body: SelectGroupBody(),
    );
  }
}
