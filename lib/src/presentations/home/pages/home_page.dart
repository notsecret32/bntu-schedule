import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
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
                'Расписание',
                style: theme.textTheme.headlineLarge,
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
                const BottomNavigationBarItem(
                  icon: Icon(Icons.schedule),
                  label: 'Расписание',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Преподаватели',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_sharp),
                  label: 'Экзамены',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'Новости',
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
