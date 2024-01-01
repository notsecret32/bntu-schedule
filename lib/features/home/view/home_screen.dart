import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/generated/l10n.dart';
import 'package:bntu_schedule/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  weight: 30,
                ),
                onPressed: () {
                  router.navigateNamed('/settings');
                },
              ),
              title: Text(
                S.of(context).schedule,
                style: theme.textTheme.titleMedium,
              ),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: true,
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: theme.hintColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index) => _openPage(index, tabsRouter),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.schedule),
                  label: S.of(context).schedule,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.people),
                  label: S.of(context).teacher,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.assignment_sharp),
                  label: S.of(context).exams,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.newspaper),
                  label: S.of(context).news,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
