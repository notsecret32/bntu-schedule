import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/router/router.dart';
import 'package:bntu_schedule/src/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/src/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      animatePageTransition: false,
      routes: const <PageRouteInfo>[
        SchedulesRoute(),
        TeachersRoute(),
        ExamsRoute(),
        NewsRoute(),
        SettingsRoute(),
      ],
      builder: (
        BuildContext context,
        Widget child,
        TabController tabController,
      ) {
        final TabsRouter autoTabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'БНТУ Расписание',
          ),
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(
            tabsRouter: autoTabsRouter,
          ),
        );
      },
    );
  }
}
