import 'dart:io';

import 'package:bntu_schedule/core/config/firebase_options.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Initializes the [Firebase] application.
Future<void> initializeFirebaseApp() async {
  // App Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

/// Initializing the [Firebase] modules.
Future<void> initializeFirebaseModules() async {
  // App Check Initialization
  await sl<FirebaseAppCheck>().activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  // Firestore Settings
  final FirebaseFirestore firestore = sl<FirebaseFirestore>();

  // Enable firestore caching (Android & iOS)
  firestore.settings = const Settings(persistenceEnabled: true);

  // Enable firestore caching (Web)
  if (kIsWeb) {
    await firestore.enablePersistence(
      const PersistenceSettings(synchronizeTabs: true),
    );
  }

  // Firebase Crashlytics
  FlutterError.onError = (FlutterErrorDetails errorData) {
    sl<FirebaseCrashlytics>().recordFlutterError(errorData);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    sl<FirebaseCrashlytics>().recordError(error, stack, fatal: true);
    return true;
  };

  // Loading Firebase Emulators
  if (const bool.fromEnvironment('FIREBASE_USE_EMU')) {
    _configureFirebaseFirestore();
  }
}

void _configureFirebaseFirestore() {
  const String configHost = String.fromEnvironment('FIREBASE_EMU_URL');
  const int configPort = int.fromEnvironment('FIRESTORE_EMU_URL');

  // Android Emulator must be pointed to 10.0.2.2
  final String defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  final String host = configHost.isNotEmpty ? configHost : defaultHost;
  const int port = configPort != 0 ? configPort : 8080;

  sl<FirebaseFirestore>().useFirestoreEmulator(host, port);

  sl<Talker>().info('Using Firebase Firestore on: $host:$port');
}
