import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_services/app/di.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/app/routes.dart';
import 'package:firebase_services/presentation/widgets/lecture_card.dart';
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
  bool _isAdding = false;
  bool _isClearing = false;

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
        actions: [
          TextButton(
            onPressed: () async {
              setState(() => _isAdding = true);
              await _lecturesRepository.fillDatabase();
              if (mounted) {
                setState(() => _isAdding = false);
              }
            },
            child: _isAdding
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : const Text('Add lectures'),
          ),
          TextButton(
            onPressed: () async {
              setState(() => _isClearing = true);
              await _lecturesRepository.clearDatabase();
              if (mounted) {
                setState(() => _isClearing = false);
              }
            },
            child: _isClearing
                ? const CupertinoActivityIndicator()
                : const Text('Clear'),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _lecturesRepository.lectureStream,
        builder: (context, snapshot) {
          final lessons = snapshot.data;
          if (lessons == null) {
            return const CupertinoActivityIndicator();
          }
          if (lessons.isEmpty) {
            return const Center(child: Text('No data'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: lessons.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return InkWell(
                onTap: () {
                  FirebaseAnalytics.instance.logEvent(
                    name: 'lesson_tap',
                    parameters: {
                      'youtubeId': lesson.youtubeVideoId,
                    },
                  );
                },
                child: LectureCard(lecture: lesson),
              );
            },
          );
        },
      ),
    );
  }
}
