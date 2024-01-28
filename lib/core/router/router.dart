import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/router/guards/guards.dart';
import 'package:bntu_schedule/features/admin/presentation/pages/admin_authentication_page.dart';
import 'package:bntu_schedule/features/admin/presentation/pages/admin_panel_page.dart';
import 'package:bntu_schedule/features/schedules/presentation/pages/pages.dart';
import 'package:bntu_schedule/features/welcome/presentation/pages/pages.dart';
import 'package:bntu_schedule/injection.dart';

part 'router.gr.dart';

/// A class for working with routes, stores a list of available router.
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        /// ========== [Home] ==========
        AutoRoute(
          page: SchedulesRoute.page,
          path: schedulesPageRouteKey,
          guards: <AutoRouteGuard>[sl<GroupMustBeSelectedGuard>()],
          children: <AutoRoute>[
            AutoRoute(
              page: SettingsRoute.page,
              path: settingsPageRouteKey,
            ),
          ],
        ),

        /// ========== [Admin] ==========
        AutoRoute(
          page: AdminHomePanelRoute.page,
          path: adminPanelPageRouteKey,
          guards: <AutoRouteGuard>[sl<AuthGuard>()],
        ),

        /// ========== [Other] ==========
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
          page: AdminAuthenticationRoute.page,
          path: adminLoginPageRouteKey,
        ),
      ];
}
