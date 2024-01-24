import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// The default list of [BottomNavigationBarItem].
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
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Настройки',
  ),
];

/// Wrapper over the [BottomNavigationBar] widget, used to minimize repetitive code.
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.tabsRouter,
    this.items,
  });

  /// A controller for navigating between pages using the [BottomNavigationBar].
  final TabsRouter tabsRouter;

  /// List of buttons for the [BottomNavigationBar].
  final List<BottomNavigationBarItem>? items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: theme.hintColor,
      currentIndex: tabsRouter.activeIndex,
      onTap: (int index) => _openPage(index, tabsRouter),
      items: items == null ? defaultBottomNavigationItems : items!.toList(),
    );
  }

  /// Opens the page by index.
  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
