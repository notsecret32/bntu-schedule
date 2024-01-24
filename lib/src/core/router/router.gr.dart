// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminLoginPage(),
      );
    },
    ExamRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExamPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsPage(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SchedulePage(),
      );
    },
    SelectGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectGroupPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsPage(),
      );
    },
    TeacherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TeacherPage(),
      );
    },
  };
}

/// generated route for
/// [AdminLoginPage]
class AdminLoginRoute extends PageRouteInfo<void> {
  const AdminLoginRoute({List<PageRouteInfo>? children})
      : super(
          AdminLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'Admin Login';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExamPage]
class ExamRoute extends PageRouteInfo<void> {
  const ExamRoute({List<PageRouteInfo>? children})
      : super(
          ExamRoute.name,
          initialChildren: children,
        );

  static const String name = 'Exams';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'News';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SchedulePage]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'Schedules';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectGroupPage]
class SelectGroupRoute extends PageRouteInfo<void> {
  const SelectGroupRoute({List<PageRouteInfo>? children})
      : super(
          SelectGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'Select Group';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeacherPage]
class TeacherRoute extends PageRouteInfo<void> {
  const TeacherRoute({List<PageRouteInfo>? children})
      : super(
          TeacherRoute.name,
          initialChildren: children,
        );

  static const String name = 'Teachers';

  static const PageInfo<void> page = PageInfo<void>(name);
}
