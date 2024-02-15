import 'package:bntu_schedule/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

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

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
  );
}
