import 'dart:async';

import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Checks whether the admin is actually logged in or not.
class AdminAuthenticationRedirect {
  AdminAuthenticationRedirect({
    required FirebaseAuth auth,
  }) : _auth = auth;

  /// An instance of the [FirebaseAuth] class for working with authorization.
  final FirebaseAuth _auth;

  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final Talker talker = sl<Talker>();

    try {
      talker.info('Check the admin for existence (Auth Guard)');

      talker.info('Admin email: ${_auth.currentUser}');

      if (_auth.currentUser != null) {
        talker.good('It looks like the admin exists, redirect him admin panel');

        return RoutesList.adminPanelPage.path;
      } else {
        talker.warning(
          'The admin did not pass the existence check, return him to the AdminLogin page',
        );

        return RoutesList.adminAuthenticationPage.path;
      }
    } catch (e) {
      throw Exception(
        '''
        Something went wrong when trying to check if the admin exists or not.

        Error: $e
        ''',
      );
    }
  }
}
