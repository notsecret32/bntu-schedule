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
    fullPath: '/',
    redirect: sl<HasWelcomePageViewedRedirect>(),
  );

  /// The group selection page.
  static final CustomGoRouteData selectGroupPage = CustomGoRouteData(
    path: '/schedules',
    name: 'schedules',
    fullPath: '/schedules',
  );

  /// Schedule view page.
  static final CustomGoRouteData scheduleViewPage = CustomGoRouteData(
    path: ':groupNumber',
    name: 'selected-group',
    fullPath: '/schedules/:groupNumber',
    redirect: sl<GroupNumberMustBeSelected>(),
  );

  /// Settings of the page for viewing the schedule.
  static final CustomGoRouteData schedulesSettingsPage = CustomGoRouteData(
    path: 'settings',
    name: 'schedules-settings',
    fullPath: '/schedules/settings',
  );

  /// The admin panel page.
  static final CustomGoRouteData adminPanelPage = CustomGoRouteData(
    path: '/admin',
    name: 'admin-panel',
    fullPath: '/admin',
    redirect: sl<AdminAuthenticationRedirect>(),
  );

  /// The admin's authorization page.
  static final CustomGoRouteData adminAuthenticationPage = CustomGoRouteData(
    path: 'auth',
    name: 'admin-auth',
    fullPath: '/admin/auth',
  );

  /// A method that builds a string to get the path to the schedule of
  /// a certain group.
  static String navigateToSelectedGroup(String selectedGroupNumber) {
    return '${selectGroupPage.path}/$selectedGroupNumber';
  }
}
