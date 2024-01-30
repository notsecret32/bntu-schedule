import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/bloc/settings_bloc.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SchedulesSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Настройки',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () => context.pop(),
      ),
      body: SafeArea(
        child: BlocProvider<SettingsBloc>(
          create: (BuildContext context) => sl<SettingsBloc>(),
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
                          context.goNamed(
                            RoutesList.schedulesSelectGroupPage.name,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
