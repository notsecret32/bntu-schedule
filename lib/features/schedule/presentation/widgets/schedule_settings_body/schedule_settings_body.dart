import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:custom_widgets/widgets.dart'
    show CustomButton, CustomSnackBarViewer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScheduleSettingsBody extends StatelessWidget {
  const ScheduleSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<GroupBloc, GroupState>(
        listenWhen: (_, GroupState current) =>
            current is GroupFailureState || current is GroupLoadedState,
        listener: (BuildContext context, GroupState state) {
          if (state is GroupFailureState) {
            CustomSnackBarViewer.showSnackBar(
              context: context,
              text: state.message,
              error: true,
            );
          }

          if (state is GroupLoadedState) {
            context.goNamed(RoutesList.selectGroupPage.name);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomButton(
                text: 'Выйти с группы',
                backgroundColor: Colors.red,
                onPressed: () async {
                  context
                      .read<GroupBloc>()
                      .add(RemoveSelectedGroupNumberEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
