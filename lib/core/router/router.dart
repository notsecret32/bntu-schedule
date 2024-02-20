import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/features/admin/presentation/pages/admin_auth_page.dart';
import 'package:bntu_schedule/features/admin/presentation/pages/admin_home_page.dart';
import 'package:bntu_schedule/features/schedule/presentation/pages/pages.dart';
import 'package:bntu_schedule/features/welcome/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// List of all available routes.
final GoRouter appGoRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: RoutesList.welcomePage.name,
      path: RoutesList.welcomePage.path,
      redirect: RoutesList.welcomePage.redirect,
      builder: (BuildContext context, GoRouterState state) =>
          const WelcomePage(),
    ),
    GoRoute(
      name: RoutesList.selectGroupPage.name,
      path: RoutesList.selectGroupPage.path,
      builder: (BuildContext context, GoRouterState state) => SelectGroupPage(),
      routes: <RouteBase>[
        GoRoute(
          name: RoutesList.schedulesSettingsPage.name,
          path: RoutesList.schedulesSettingsPage.path,
          builder: (BuildContext context, GoRouterState state) =>
              ScheduleSettingsPage(),
        ),
        GoRoute(
          path: RoutesList.scheduleViewPage.path,
          redirect: RoutesList.scheduleViewPage.redirect,
          builder: (BuildContext context, GoRouterState state) => SchedulePage(
            groupNumber: state.pathParameters['groupNumber']!,
          ),
        ),
      ],
    ),
    GoRoute(
      name: RoutesList.adminPanelPage.name,
      path: RoutesList.adminPanelPage.path,
      redirect: RoutesList.adminPanelPage.redirect,
      builder: (BuildContext context, GoRouterState state) =>
          const AdminHomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: RoutesList.adminAuthenticationPage.name,
          path: RoutesList.adminAuthenticationPage.path,
          builder: (BuildContext context, GoRouterState state) =>
              const AdminAuthPage(),
        ),
      ],
    ),
  ],
);
