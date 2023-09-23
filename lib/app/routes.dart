import 'package:firebase_services/presentation/auth_page.dart';
import 'package:firebase_services/presentation/lectures_page.dart';
import 'package:firebase_services/presentation/profile_page.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const auth = '/auth';
  static const lectures = '/lectures';
  static const profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    auth: (_) => const AuthPage(),
    lectures: (_) => const LecturesPage(),
    profile: (_) => ProfilePage(),
  };
}
