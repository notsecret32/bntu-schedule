import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

const List<BottomNavigationBarItem> defaultBottomNavigationItems =
    <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.schedule),
    label: 'Расписание',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.people),
    label: 'Преподаватели',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.assignment_sharp),
    label: 'Экзамены',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.newspaper),
    label: 'Новости',
  ),
];

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.tabsRouter,
    required this.router,
    this.items = defaultBottomNavigationItems,
  });

  final TabsRouter tabsRouter;
  final StackRouter router;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: theme.hintColor,
      currentIndex: tabsRouter.activeIndex,
      onTap: (int index) => _openPage(index, tabsRouter),
      items: items
          .map(
            (BottomNavigationBarItem item) => BottomNavigationBarItem(
              label: item.label,
              icon: item.icon,
              activeIcon: item.activeIcon,
              backgroundColor: item.backgroundColor,
              tooltip: item.tooltip,
            ),
          )
          .toList(),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
