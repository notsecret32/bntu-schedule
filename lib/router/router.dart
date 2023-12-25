import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/features/schedule/view/schedule_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: ScheduleRoute.page, path: '/'),
      ];
}
