import 'package:talker_flutter/talker_flutter.dart';

import '../../injection.dart';

/// Initializing logging.
///
/// Logging is configured for:
/// * Bloc
/// * Flutter
///
/// The [Talker] is used for logging.
Future<void> initializeLoggers() async {
  final Talker talker = sl<Talker>();

  talker.debug('Talker started...');
}
