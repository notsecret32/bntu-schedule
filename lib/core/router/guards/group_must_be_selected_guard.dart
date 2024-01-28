import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/router/router.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A class that checks whether a group number is entered or not.
///
/// The group number is checked in the cache, if it is there, then guard skips further.
/// If the group number is not specified, then guard redirects to the `[SelectGroupPage]`.
class GroupMustBeSelectedGuard extends AutoRouteGuard {
  GroupMustBeSelectedGuard({
    required this.sharedPreferences,
  });

  /// Storage for storing simple data.
  final SharedPreferences sharedPreferences;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Get the number of the selected group from the cache
    final String? selectedGroup = sharedPreferences.getString(
      'selected_group',
    );

    sl<Talker>().info('Selected group: ${selectedGroup ?? 'not selected'}');

    if (selectedGroup != null) {
      // If there is a group, go to the main page

      sl<Talker>().good('The passage has been successfully resolved');
      resolver.next();
    } else {
      // Otherwise, redirect to the [SelectGroupPage]

      sl<Talker>().warning(
        'The group is not specified, redirecting to the SelectGroup page',
      );

      resolver.redirect(const SelectGroupRoute());
    }
  }
}
