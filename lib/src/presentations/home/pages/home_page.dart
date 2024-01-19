import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/router/router.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsRouter(
        routes: const <PageRouteInfo>[
          ScheduleRoute(),
          TeacherRoute(),
          ExamRoute(),
          NewsRoute(),
        ],
        builder: (BuildContext context, Widget child) {
          final TabsRouter tabsRouter = AutoTabsRouter.of(context);
          final StackRouter router = AutoRouter.of(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Расписание',
              icon: Icons.settings,
              onPress: () async => await router.pushNamed('/settings'),
            ),
            body: child,
            bottomNavigationBar: CustomBottomNavigationBar(
              tabsRouter: tabsRouter,
            ),
          );
        },
      ),
    );
  }
}
