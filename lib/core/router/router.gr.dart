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
    AdminAuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminAuthenticationPage(),
      );
    },
    AdminHomePanelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminSchedulePage(),
      );
    },
    SchedulesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SchedulesPage(),
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
        child: SchedulesSettingsPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [AdminAuthenticationPage]
class AdminAuthenticationRoute extends PageRouteInfo<void> {
  const AdminAuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AdminAuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAuthenticationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdminSchedulePage]
class AdminHomePanelRoute extends PageRouteInfo<void> {
  const AdminHomePanelRoute({List<PageRouteInfo>? children})
      : super(
          AdminHomePanelRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomePanelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SchedulesPage]
class SchedulesRoute extends PageRouteInfo<void> {
  const SchedulesRoute({List<PageRouteInfo>? children})
      : super(
          SchedulesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SchedulesRoute';

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

  static const String name = 'SelectGroupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SchedulesSettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
