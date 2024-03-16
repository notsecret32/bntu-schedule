import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';

/// List of all available routes.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (_, __) => const HomeScreen(),
    ),
  ],
);
