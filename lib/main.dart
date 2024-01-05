import 'package:bntu_schedule/bntu_schedule_app.dart';
import 'package:bntu_schedule/core/firebase/firebase.dart';
import 'package:bntu_schedule/core/logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  await initializeLoggers();
  await initializeFirebaseApp();
  runApp(const BntuScheduleApp());
}
