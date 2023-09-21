import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              throw Exception('My Crashlytics');
            },
            child: const Text('Send Crash')),
      ),
    );
  }
}
