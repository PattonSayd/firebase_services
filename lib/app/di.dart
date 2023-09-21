import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    _initCrashlytics();
  }

  static Future<void> _initFirebase() async {
    logger.d('Firebase initialization started');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    logger.d('Firebase initialized');
  }

  static void _initCrashlytics() {
    FlutterError.onError = (errorDetails) {
      logger.e('Caught error in FlutterError.onError');
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logger.e('Caught error in PlatformDispatcher.onError');
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    logger.d('Crashlytics initialized');
  }

  static Future<void> dispose() async {}
}
