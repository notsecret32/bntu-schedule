import 'package:bntu_schedule/core/router/custom_go_route_data.dart';
import 'package:bntu_schedule/core/router/redirects/redirects.dart';
import 'package:bntu_schedule/injection.dart';

/// A list of all available routes and their basic data.
///
/// It is used to specify the exact path so as not to make a mistake.
class RoutesList {
  /// Welcome page, launched every first time and only once.
  static final CustomGoRouteData welcomePage = CustomGoRouteData(
    path: '/',
    name: 'welcome',
    redirect: sl<HasWelcomePageViewedRedirect>(),
  );

  /// The group selection page.
  static final CustomGoRouteData schedulesSelectGroupPage = CustomGoRouteData(
    path: '/schedules',
    name: 'schedules',
  );

  /// Schedule view page.
  static final CustomGoRouteData schedulesGroupNumberPage = CustomGoRouteData(
    path: ':groupNumber',
    name: 'selected-group',
    redirect: sl<GroupNumberMustBeSelected>(),
  );

  /// Settings of the page for viewing the schedule.
  static final CustomGoRouteData schedulesSettingsPage = CustomGoRouteData(
    path: 'settings',
    name: 'schedules-settings',
  );

  /// The admin panel page.
  static final CustomGoRouteData adminPanelPage = CustomGoRouteData(
    path: '/admin',
    name: 'admin-panel',
    redirect: sl<AdminAuthenticationRedirect>(),
  );

  /// The admin's authorization page.
  static final CustomGoRouteData adminAuthenticationPage = CustomGoRouteData(
    path: 'auth',
    name: 'admin-auth',
  );

  /// A method that builds a string to get the path to the schedule of
  /// a certain group.
  static String navigateToSelectedGroup(String selectedGroupNumber) {
    return '${schedulesSelectGroupPage.path}/$selectedGroupNumber';
  }
}
