import 'package:firebase_services/app/di.dart';
import 'package:firebase_services/app/routes.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase services',
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.auth,
      routes: AppRoutes.routes,
    );
  }

  @override
  void dispose() {
    Locator.dispose();
    super.dispose();
  }
}
