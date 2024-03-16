import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/schedule_settings_body/schedule_settings_body.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:custom_widgets/widgets.dart' show CustomAppBar;
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
          onLeadingIconPressed: () => context.pop(),
        ),
        body: const ScheduleSettingsBody(),
      ),
    );
  }
}
