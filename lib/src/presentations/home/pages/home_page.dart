import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/constants/routes.dart';
import 'package:bntu_schedule/src/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/src/presentations/schedules/pages/pages.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'БНТУ Расписание',
        icon: Icons.settings,
        onPress: () async => await router.navigateNamed(
          homeSettingsPageRouteKey,
        ),
      ),
      body: SchedulesPage(),
    );
  }
}
