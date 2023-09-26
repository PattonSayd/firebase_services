import 'package:firebase_services/app/di.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/app/routes.dart';
import 'package:firebase_services/app/theme.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final userRepository = Locator.userRepository;
  final configRepository = Locator.configRepository;

  @override
  Widget build(BuildContext context) {
    final isAuthorized = userRepository.isAuthorized;
    final useDarkTheme = configRepository.useDarkTheme;
    logger.d('User authorized: $isAuthorized');

    return MaterialApp(
      title: 'Firebase services',
      debugShowCheckedModeBanner: false,
      themeMode: useDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: isAuthorized ? AppRoutes.lectures : AppRoutes.auth,
      routes: AppRoutes.routes,
    );
  }

  @override
  void dispose() {
    Locator.dispose();
    super.dispose();
  }
}
