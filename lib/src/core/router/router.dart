import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/router/group_must_be_selected_guard.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:bntu_schedule/src/presentations/admin-login/pages/admin_login_page.dart';
import 'package:bntu_schedule/src/presentations/exam/pages/exam_page.dart';
import 'package:bntu_schedule/src/presentations/home/pages/home_page.dart';
import 'package:bntu_schedule/src/presentations/news/pages/news_page.dart';
import 'package:bntu_schedule/src/presentations/schedule/pages/schedule_page.dart';
import 'package:bntu_schedule/src/presentations/select-group/pages/select_group_page.dart';
import 'package:bntu_schedule/src/presentations/settings/pages/settings_page.dart';
import 'package:bntu_schedule/src/presentations/teacher/pages/teacher_page.dart';

part 'router.gr.dart';

/// A class for working with routes, stores a list of available router.
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          guards: <AutoRouteGuard>[sl<GroupMustBeSelectedGuard>()],
          children: <AutoRoute>[
            AutoRoute(
              page: ScheduleRoute.page,
              path: 'schedule',
            ),
            AutoRoute(
              page: TeacherRoute.page,
              path: 'teacher',
            ),
            AutoRoute(
              page: ExamRoute.page,
              path: 'exam',
            ),
            AutoRoute(
              page: NewsRoute.page,
              path: 'news',
            ),
          ],
        ),
        AutoRoute(
          page: SettingsRoute.page,
          guards: <AutoRouteGuard>[sl<GroupMustBeSelectedGuard>()],
          path: '/settings',
        ),
        AutoRoute(
          page: SelectGroupRoute.page,
          path: '/select-group',
        ),
        AutoRoute(
          page: AdminLoginRoute.page,
          path: '/admin-login',
        ),
      ];
}
