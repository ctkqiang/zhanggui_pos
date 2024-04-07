// ignore_for_file: must_be_immutable

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zhanggui_pos/pages/splash_screen.dart';

const appName = "掌柜POS";

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await GetStorage.init();
    await Firebase.initializeApp();
    await dotenv.load(fileName: "assets/.env");

    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(MainApp(name: appName));
  } catch (issue) {
    throw issue.toString();
  }
}

class MainApp extends StatefulWidget {
  String? name;

  MainApp({Key? key, required name}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SharEV",
      navigatorObservers: [observer],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("zh")],
      home: SplashScreen(name: appName),
    );
  }
}
