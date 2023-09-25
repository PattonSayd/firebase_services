import 'package:firebase_services/app/di.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/app/routes.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LecturesPage extends StatefulWidget {
  const LecturesPage({super.key});

  @override
  State<LecturesPage> createState() => _LecturesPageState();
}

class _LecturesPageState extends State<LecturesPage> {
  final _lecturesRepository = Locator.lecturesRepository;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    logger.w('LecturesPage build');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        leading: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.profile),
          child: const UserAvatar(size: 36),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text('Lectures page'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                setState(() => _isLoading = true);
                _lecturesRepository.lectureStream;
                await _lecturesRepository.fillDatabase();
                if (mounted) {
                  setState(() => _isLoading = false);
                }
              },
              child: _isLoading
                  ? const CupertinoActivityIndicator()
                  : const Text('Add lectures'),
            ),
          ],
        ),
      ),
    );
  }
}
