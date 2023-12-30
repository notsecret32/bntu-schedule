import 'dart:async';

import 'package:bntu_schedule/bntu_schedule_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  runZonedGuarded(
    () {
      BindingBase.debugZoneErrorsAreFatal = true;

      WidgetsFlutterBinding.ensureInitialized();

      final Talker talker = TalkerFlutter.init();
      GetIt.I.registerSingleton(talker);
      GetIt.I<Talker>().debug('Talker started...');

      final Dio dio = Dio();
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printResponseData: false,
          ),
        ),
      );

      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(
          printStateFullData: false,
          printEventFullData: false,
        ),
      );

      FlutterError.onError = (FlutterErrorDetails details) =>
          GetIt.I<Talker>().handle(details.exception, details.stack);

      runApp(const BntuScheduleApp());
    },
    (Object e, StackTrace st) => GetIt.I<Talker>().handle(e, st),
  );
}
