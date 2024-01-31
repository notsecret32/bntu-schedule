import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScheduleSettingsView extends StatelessWidget {
  const ScheduleSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Настройки',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () => context.pop(),
      ),
      body: const ScheduleSettingsBody(),
    );
  }
}
