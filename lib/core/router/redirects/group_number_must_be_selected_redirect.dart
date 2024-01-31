import 'dart:async';

import 'package:bntu_schedule/core/constants/cache_keys.dart';
import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A class that checks whether a group number is selected or not.
class GroupNumberMustBeSelected {
  GroupNumberMustBeSelected({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  /// Storage for storing simple data.
  final SharedPreferences _sharedPreferences;

  FutureOr<String?> call(BuildContext context, GoRouterState state) async {
    final String? selectedGroupNumber = _sharedPreferences.getString(
      selectedGroupKey,
    );

    sl<Talker>().info('Selected group: $selectedGroupNumber');

    if (selectedGroupNumber == null) {
      sl<Talker>().warning(
        'The group is not specified, redirecting to the SelectGroup page',
      );

      return RoutesList.selectGroupPage.path;
    }

    final String? selectedGroupByParams = state.pathParameters['groupNumber'];

    sl<Talker>().info(
      'Selected group by params: ${selectedGroupByParams ?? 'not selected'}',
    );

    if (selectedGroupByParams == null || selectedGroupByParams.length != 8) {
      sl<Talker>().warning(
        'The group number == null or length != 8, redirecting to the SelectGroup page',
      );

      return RoutesList.navigateToSelectedGroup(selectedGroupNumber);
    }

    sl<Talker>().good(
      'The group number from the parameters is suitable, changing the selected group number to: $selectedGroupByParams',
    );

    _sharedPreferences.setString(selectedGroupKey, selectedGroupByParams);

    return RoutesList.navigateToSelectedGroup(selectedGroupByParams);
  }
}
