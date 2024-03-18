import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';

typedef GroupNumber = String;

class GroupNumberNotifier extends StateNotifier<GroupNumber?> {
  GroupNumberNotifier({
    required this.sharedPreferences,
  }) : super(null);

  final SharedPreferences sharedPreferences;

  Future<bool> setGroupNumber({required GroupNumber groupNumber}) async {
    state = groupNumber;
    log('SelectGroupNotifier: setGroupNumber(...) => state=$state');
    return sharedPreferences.setString(selectedGroupNumberKey, groupNumber);
  }

  Future<bool> removeGroupNumber() async {
    state = null;
    return sharedPreferences.remove(selectedGroupNumberKey);
  }
}
