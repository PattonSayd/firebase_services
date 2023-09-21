import 'package:firebase_services/app/app.dart';
import 'package:firebase_services/app/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Locator.init();
  runApp(const App());
}
