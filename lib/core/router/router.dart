import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/features/exam/presentation/pages/exam_page.dart';
import 'package:bntu_schedule/features/home/home.dart';
import 'package:bntu_schedule/features/news/news.dart';
import 'package:bntu_schedule/features/schedule/presentation/pages/schedule_page.dart';
import 'package:bntu_schedule/features/settings/settings.dart';
import 'package:bntu_schedule/features/teacher/teacher.dart';

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
