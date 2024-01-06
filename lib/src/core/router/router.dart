import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/presentations/exam/pages/exam_page.dart';
import 'package:bntu_schedule/src/presentations/home/pages/home_page.dart';
import 'package:bntu_schedule/src/presentations/news/pages/news_page.dart';
import 'package:bntu_schedule/src/presentations/schedule/pages/schedule_page.dart';
import 'package:bntu_schedule/src/presentations/settings/pages/settings_page.dart';
import 'package:bntu_schedule/src/presentations/teacher/pages/teacher_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
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
          path: '/settings',
        ),
      ];
}
