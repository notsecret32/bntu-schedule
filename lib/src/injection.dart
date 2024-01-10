import 'package:bntu_schedule/src/core/network/network_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeInjection() async {
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(
      sl(),
    ),
  );

  sl.registerLazySingleton(InternetConnectionChecker.new);
  sl.registerLazySingleton(SharedPreferences.getInstance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseAppCheck.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
