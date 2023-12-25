import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'features/schedule/view/schedule_screen.dart';

void main() {
  final Talker talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

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

  runZonedGuarded(() => runApp(const BntuScheduleApp()),
      (Object e, StackTrace st) {
    GetIt.I<Talker>().handle(e, st);
  });
}

class BntuScheduleApp extends StatelessWidget {
  const BntuScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'БНТУ Расписание',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(71, 135, 232, 0),
        ),
        useMaterial3: true,
      ),
      home: ScheduleScreen(),
    );
  }
}
