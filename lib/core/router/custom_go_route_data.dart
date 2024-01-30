import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A class for storing information about the route.
final class CustomGoRouteData {
  CustomGoRouteData({
    required this.path,
    required this.name,
    required this.fullPath,
    this.redirect,
  });

  /// The path to the desired page.
  final String path;

  /// The name of this route is used to abstract from the path.
  final String name;

  /// The full path to the page. It is used to specify the full path mainly in
  /// redirects.
  final String fullPath;

  /// The redirect method for this router.
  final FutureOr<String?> Function(
    BuildContext context,
    GoRouterState state,
  )? redirect;
}
