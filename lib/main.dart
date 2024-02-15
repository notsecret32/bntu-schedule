import 'package:bntu_schedule/core/firebase/firebase.dart';
import 'package:bntu_schedule/core/logging/logging.dart';
import 'package:bntu_schedule/core/router/router.dart';
import 'package:bntu_schedule/core/theme/theme.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Loading data from the .env file
  await dotenv.load();

  // Setting up Firebase
  await initializeFirebaseApp();

  // Initializing the injection
  await initializeInjection();

  // Initializing the Firebase modules
  await initializeFirebaseModules();

  // Initializing logging
  await initializeLoggers();

  // Run the app
  runApp(const BntuScheduleApp());
}

/// The main application.
///
/// The main application that runs in the `main` method.
class BntuScheduleApp extends StatefulWidget {
  const BntuScheduleApp({super.key});

  @override
  State<BntuScheduleApp> createState() => _BntuScheduleAppState();
}

class _BntuScheduleAppState extends State<BntuScheduleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'БНТУ Расписание',
      theme: themeData,
      routerConfig: appGoRouter,
    );
  }
}
