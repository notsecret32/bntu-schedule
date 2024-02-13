import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/schedule_settings_page/schedule_settings_body.dart';
import 'package:bntu_schedule/features/schedule/schedule.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScheduleSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupBloc>(
      create: (BuildContext context) => sl<GroupBloc>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Настройки',
          leadingIcon: Icons.arrow_back,
          onLeadingIconPress: () => context.pop(),
        ),
        body: const ScheduleSettingsBody(),
      ),
    );
  }
}
