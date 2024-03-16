import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// A global object that stores instances of other classes for
/// independent injection.
final GetIt sl = GetIt.instance;

/// A method for initializing all necessary objects.
Future<void> initializeInjection() async {
  /// ========== [External] ==========
  /// [Logging]
  sl.registerSingleton<Talker>(TalkerFlutter.init());

  /// [Firebase]
  sl.registerLazySingleton<FirebaseAppCheck>(() => FirebaseAppCheck.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  /// [Firebase Analytics]
  sl.registerSingleton<FirebaseCrashlytics>(FirebaseCrashlytics.instance);

  /// [Shared Preferences]
  sl.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );

  /// [Internet Connection Checker]
  sl.registerLazySingleton<InternetConnectionChecker>(
    InternetConnectionChecker.new,
  );
}
