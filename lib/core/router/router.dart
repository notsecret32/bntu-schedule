import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';

/// List of all available routes.
final GoRouter router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: '/onboarding',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (_, __) => const OnboardingScreen(),
    ),
  ],
);
