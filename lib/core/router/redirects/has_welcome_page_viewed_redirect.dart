import 'dart:async';

import 'package:bntu_schedule/core/constants/cache_keys.dart';
import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Checks whether the welcome page has been viewed before or not.
///
/// If the page is considered viewed, then navigate the user to the
/// `SelectGroup` page.
class HasWelcomePageViewedRedirect {
  HasWelcomePageViewedRedirect({
    required FirebaseAuth auth,
    required SharedPreferences sharedPreferences,
  })  : _auth = auth,
        _sharedPreferences = sharedPreferences;

  /// An instance of the [FirebaseAuth] class for working with authorization.
  final FirebaseAuth _auth;

  /// Storage for storing simple data.
  final SharedPreferences _sharedPreferences;

  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final Talker talker = sl<Talker>();

    try {
      talker.info('Checking if the user has viewed the welcome page');

      final bool? hasWelcomePageViewed = _sharedPreferences.getBool(
        hasWelcomePageViewedKey,
      );

      talker.info('hasWelcomePageViewed: $hasWelcomePageViewed');

      if (hasWelcomePageViewed == null || hasWelcomePageViewed == false) {
        talker.warning(
          'The user has not viewed this page, transferring him there',
        );

        return RoutesList.welcomePage.path;
      } else {
        talker.good('The user viewed this page');

        if (_auth.currentUser != null) {
          return RoutesList.adminPanelPage.path;
        }

        final String? selectedGroup = _sharedPreferences.getString(
          selectedGroupKey,
        );

        if (selectedGroup == null) {
          return RoutesList.schedulesSelectGroupPage.path;
        }

        return RoutesList.navigateToSelectedGroup(selectedGroup);
      }
    } catch (e) {
      talker.error(
        '''
        An unexpected error has occurred.
        
        Error message: $e
        ''',
      );

      throw Exception(e);
    }
  }
}
