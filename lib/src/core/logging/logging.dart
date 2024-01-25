import 'package:bntu_schedule/src/injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  FlutterError.onError = (FlutterErrorDetails details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);
}