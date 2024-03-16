import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/schedule_body/schedule_body.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:custom_widgets/widgets.dart' show CustomAppBar;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    super.key,
    required this.groupNumber,
  });

  /// The group number obtained from the path parameters.
  final String groupNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<GroupBloc>(
          create: (_) => sl<GroupBloc>(),
        ),
        BlocProvider<ScheduleBloc>(
          create: (_) => sl<ScheduleBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Расписание',
          leadingIcon: Icons.settings,
          onLeadingIconPressed: () => context.pushNamed(
            RoutesList.schedulesSettingsPage.name,
          ),
        ),
        body: SafeArea(
          child: ScheduleBody(groupNumber: groupNumber),
        ),
      ),
    );
  }
}
