import 'package:firebase_services/app/di.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  throw Exception('My Crashlytics');
                },
                child: const Text('Send Crash')),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Locator.analytics.logEvent(
                  name: 'test_event',
                  parameters: {
                    'foo': 'bar',
                  },
                );
              },
              child: const Text('Send analytics event'),
            ),
          ],
        ),
      ),
    );
  }
}
