import 'package:bntu_schedule/router/router.dart';
import 'package:bntu_schedule/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class BntuScheduleApp extends StatefulWidget {
  const BntuScheduleApp({super.key});

  @override
  State<BntuScheduleApp> createState() => _BntuScheduleAppState();
}

class _BntuScheduleAppState extends State<BntuScheduleApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'БНТУ Расписание',
      theme: themeData,
      routerConfig: _appRouter.config(
        navigatorObservers: () => <NavigatorObserver>[
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}
