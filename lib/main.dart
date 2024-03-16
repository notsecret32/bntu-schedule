import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'core/firebase/firebase.dart';
import 'core/logging/logging.dart';
import 'core/router/router.dart';
import 'core/theme/cupertino/cupertino_theme.dart';
import 'core/theme/material/material_theme.dart';
import 'injection.dart';

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
class BntuScheduleApp extends StatelessWidget {
  const BntuScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (BuildContext context) => PlatformTheme(
        cupertinoDarkTheme: cupertinoDarkTheme,
        cupertinoLightTheme: cupertinoLightTheme,
        materialDarkTheme: materialDarkTheme,
        materialLightTheme: materialLightTheme,
        themeMode: ThemeMode.light,
        builder: (BuildContext context) => PlatformApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          routerConfig: router,
        ),
      ),
    );
  }
}
