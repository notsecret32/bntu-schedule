import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScheduleHeader extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleHeader({
    super.key,
  });

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
    );
  }
}
