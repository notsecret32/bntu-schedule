import 'package:bntu_schedule/core/config/firebase_options.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Initializes the [Firebase] application.
///
/// This is also where the application and [Firebase] modules are configured.
Future<void> initializeFirebaseApp() async {
  // App Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // App Check Initialization
  await FirebaseAppCheck.instance.activate(
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
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    sl<FirebaseCrashlytics>().recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    sl<FirebaseCrashlytics>().recordError(error, stack, fatal: true);
    return true;
  };
}
