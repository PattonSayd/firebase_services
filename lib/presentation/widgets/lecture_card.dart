import 'package:firebase_services/models/lecture.dart';
import 'package:firebase_services/presentation/widgets/youtube_thumbnail_image.dart';
import 'package:flutter/material.dart';

class LectureCard extends StatelessWidget {
  final Lecture lecture;

  const LectureCard({
    required this.lecture,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final description = lecture.description;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          YoutubeThumbnailImage(videoId: lecture.youtubeVideoId),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lecture.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (description != null)
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
