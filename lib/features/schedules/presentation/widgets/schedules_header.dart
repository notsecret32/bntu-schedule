import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SchedulesHeader extends StatelessWidget implements PreferredSizeWidget {
  const SchedulesHeader({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Расписание',
      leadingIcon: Icons.settings,
      onLeadingIconPress: () => context.pushNamed(
        RoutesList.schedulesSettingsPage.name,
      ),
      actions: <CustomAppBarActionButton>[
        CustomAppBarActionButton(
          icon: Icons.search,
          onPressed: () => _showModalBottomSheet(context),
        ),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SelectGroupBottomSheet(
          textFieldController: controller,
          onButtonPressed: () => _onSelectButtonPressed(context),
        ),
      ),
    );
  }

  void _onSelectButtonPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Hiding the Bottom Sheet
      context.pop();

      // TODO: There should be a state management here
      context.go(
        RoutesList.navigateToSelectedGroup(
          controller.text,
        ),
      );
    }
  }
}
