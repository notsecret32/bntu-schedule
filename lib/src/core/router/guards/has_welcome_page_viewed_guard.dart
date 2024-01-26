import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/constants/cache_keys.dart';
import 'package:bntu_schedule/src/core/router/router.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A guard that checks whether the welcome page has been viewed before or not.
///
/// If the page is considered viewed, then we navigate the user to the
/// `SelectGroup` page.
class HasWelcomePageViewedGuard extends AutoRouteGuard {
  HasWelcomePageViewedGuard({
    required FirebaseAuth auth,
    required SharedPreferences sharedPreferences,
  })  : _auth = auth,
        _sharedPreferences = sharedPreferences;

  /// An instance of the [FirebaseAuth] class for working with authorization.
  final FirebaseAuth _auth;

  /// Storage for storing simple data.
  final SharedPreferences _sharedPreferences;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // We take an instance of the [Talker] class to log everything that happens
    final Talker talker = sl<Talker>();

    try {
      talker.info('Checking if the user has viewed the welcome page');

      // Get a variable that stores the status of whether the page has been
      // viewed or not
      final bool? hasWelcomePageViewed = _sharedPreferences.getBool(
        hasWelcomePageViewedKey,
      );

      talker.info('hasWelcomePageViewed: $hasWelcomePageViewed');

      // If the page is not viewed
      if (hasWelcomePageViewed == null || hasWelcomePageViewed == false) {
        talker.warning(
          'The user has not viewed this page, transferring him there',
        );

        // Leave the user on this page
        resolver.nextOrBack();
      } else {
        talker.good('The user viewed this page');

        // If the admin is logged in, navigate him to the admin panel
        if (_auth.currentUser != null) {
          resolver.redirect(const AdminHomePanelRoute());
          return;
        }

        // If the user has already viewed this page, navigate him to the
        // `SelectGroup` page
        resolver.redirect(const SelectGroupRoute());
      }
    } catch (e) {
      talker.error(
        '''
        An error has occurred, we are sending the user to the welcome page.
        
        Error: $e
        ''',
      );

      // If some unexpected error has occurred, throw out the exception
      throw Exception(e);
    }
  }
}
