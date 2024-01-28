import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/router/router.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Checks whether the admin is actually logged in or not.
class AuthGuard extends AutoRouteGuard {
  AuthGuard({
    required FirebaseAuth auth,
  }) : _auth = auth;

  /// An instance of the [FirebaseAuth] class for working with authorization.
  final FirebaseAuth _auth;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final Talker talker = sl<Talker>();

    try {
      talker.info('Check the admin for existence (Auth Guard)');

      talker.info('Admin email: ${_auth.currentUser!.email ?? 'Null'}');

      if (_auth.currentUser != null) {
        talker.good('It looks like the admin exists, redirect him further');

        resolver.next();
      } else {
        talker.warning(
          'The admin did not pass the existence check, return him to the AdminLogin page',
        );

        resolver.redirect(const AdminAuthenticationRoute());
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
