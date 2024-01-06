import 'package:bntu_schedule/src/config/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
}

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseAppCheck appCheck = FirebaseAppCheck.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
