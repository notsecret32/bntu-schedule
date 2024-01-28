import 'package:bntu_schedule/core/constants/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// An abstract class for working with a welcome page.
///
/// This class describes methods for working with the page locally.
abstract class WelcomeLocalDataSource {
  /// Sets that the welcome page has been viewed by saving the value
  /// in the cache.
  Future<void> setWelcomePageViewed();
}

/// Implementation of the [WelcomeLocalDataSource] abstract class.
final class WelcomeLocalDataSourceImpl extends WelcomeLocalDataSource {
  WelcomeLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  /// A singleton for working with the device cache.
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> setWelcomePageViewed() async {
    await _sharedPreferences.setBool(hasWelcomePageViewedKey, true);
  }
}
