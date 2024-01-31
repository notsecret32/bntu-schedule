import 'package:bntu_schedule/core/constants/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An abstract class for working with local data.
abstract class GroupLocalDataSource {
  /// Sets the value of the selected group in the cache.
  Future<void> setGroupNumber(String number);

  /// Removes the selected group from the cache.
  Future<void> removeSelectedGroup();
}

/// Implementations of the abstract class [GroupLocalDataSource].
class GroupLocalDataSourceImpl extends GroupLocalDataSource {
  GroupLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  /// A singleton for working with the device cache.
  final SharedPreferences sharedPreferences;

  @override
  Future<void> setGroupNumber(String number) async {
    await sharedPreferences.setString(selectedGroupKey, number);
  }

  @override
  Future<void> removeSelectedGroup() async {
    await sharedPreferences.remove(selectedGroupKey);
  }
}
