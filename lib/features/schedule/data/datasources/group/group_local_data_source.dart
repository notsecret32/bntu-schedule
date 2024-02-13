import 'package:bntu_schedule/core/constants/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An abstract class for working with a group locally.
abstract class GroupLocalDataSource {
  /// Saves the selected group with the number [groupNumber] in the cache.
  Future<void> saveSelectedGroupNumber(String groupNumber);

  /// Returns the `group number` if the group is selected,
  /// otherwise `null` is returned.
  Future<String?> getSelectedGroupNumber();

  /// Deletes the selected group from the cache.
  /// If the group was deleted successfully, `true` is returned,
  /// otherwise `false` is returned.
  Future<bool> removeSelectedGroupNumber();
}

/// Implementation of the abstract class [GroupLocalDataSource].
class GroupLocalDataSourceImpl extends GroupLocalDataSource {
  GroupLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveSelectedGroupNumber(String groupNumber) async {
    await _sharedPreferences.setString(selectedGroupKey, groupNumber);
  }

  @override
  Future<String?> getSelectedGroupNumber() async {
    return _sharedPreferences.getString(selectedGroupKey);
  }

  @override
  Future<bool> removeSelectedGroupNumber() async {
    return await _sharedPreferences.remove(selectedGroupKey);
  }
}
