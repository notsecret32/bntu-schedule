import 'package:bntu_schedule/src/core/firebase/firebase.dart';
import 'package:bntu_schedule/src/core/logging/logging.dart';
import 'package:bntu_schedule/src/core/router/router.dart';
import 'package:bntu_schedule/src/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  await dotenv.load();
  await initializeLoggers();
  await initializeFirebaseApp();
  runApp(const BntuScheduleApp());
}

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
      debugShowCheckedModeBanner: false,
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
