import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
  }

  static Future<void> _initFirebase() async {
    logger.d('Firebase initialization started');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    logger.d('Firebase initialized');
  }

  static Future<void> dispose() async {}
}
