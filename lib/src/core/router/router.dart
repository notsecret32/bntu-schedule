import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/constants/routes.dart';
import 'package:bntu_schedule/src/core/router/guards.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:bntu_schedule/src/presentations/admin-login/pages/admin_login_page.dart';
import 'package:bntu_schedule/src/presentations/exams/pages/exams_page.dart';
import 'package:bntu_schedule/src/presentations/home/pages/home_page.dart';
import 'package:bntu_schedule/src/presentations/news/pages/news_page.dart';
import 'package:bntu_schedule/src/presentations/schedules/pages/schedules_page.dart';
import 'package:bntu_schedule/src/presentations/select-group/pages/select_group_page.dart';
import 'package:bntu_schedule/src/presentations/settings/pages/settings_page.dart';
import 'package:bntu_schedule/src/presentations/teachers/pages/teachers_page.dart';
import 'package:bntu_schedule/src/presentations/welcome/pages/pages.dart';

part 'router.gr.dart';

/// A class for working with routes, stores a list of available router.
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          path: homePageRouteKey,
          guards: <AutoRouteGuard>[sl<GroupMustBeSelectedGuard>()],
          children: <AutoRoute>[
            AutoRoute(
              page: SchedulesRoute.page,
              path: schedulesPageRouteKey,
            ),
            AutoRoute(
              page: TeachersRoute.page,
              path: teachersPageRouteKey,
            ),
            AutoRoute(
              page: ExamsRoute.page,
              path: examsPageRouteKey,
            ),
            AutoRoute(
              page: NewsRoute.page,
              path: newsPageRouteKey,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: settingsPageRouteKey,
            ),
          ],
        ),
        AutoRoute(
          page: WelcomeRoute.page,
          guards: <AutoRouteGuard>[
            sl<HasWelcomePageViewedGuard>(),
          ],
          path: '/',
        ),
        AutoRoute(
          page: SelectGroupRoute.page,
          path: selectGroupPageRouteKey,
        ),
        AutoRoute(
          page: AdminLoginRoute.page,
          path: adminLoginPageRouteKey,
        ),
      ];
}
