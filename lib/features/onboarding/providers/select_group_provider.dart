import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';
import '../../../core/providers/shared_preferences_provider.dart';

part 'select_group_provider.g.dart';

@riverpod
Future<void> setSelectedGroupNumber(
  SetSelectedGroupNumberRef ref, {
  required String groupNumber,
}) async {
  final SharedPreferences preferences = ref.read(sharedPreferencesProvider);
  await preferences.setString(selectedGroupNumberKey, groupNumber);
}
