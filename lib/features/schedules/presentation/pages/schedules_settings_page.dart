import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/bloc/settings_bloc.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SchedulesSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) => sl<SettingsBloc>(),
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (BuildContext context, SettingsState state) {
                return Column(
                  children: <Widget>[
                    /// ========== [Remove Selected Group] ==========
                    CustomButton(
                      text: 'Выйти с группы',
                      backgroundColor: Colors.red,
                      onPress: () async {
                        context
                            .read<SettingsBloc>()
                            .add(SettingsRemoveSelectedGroupEvent());
                        await router.pushNamed(selectGroupPageRouteKey);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}