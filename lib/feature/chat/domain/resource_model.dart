import 'package:flutter/material.dart';

enum ResourceType { ppt, video, image }

class LearningResource {
  final String title;
  final String subtitle;
  final String imagePath;
  final ResourceType type;
  final String url;

  LearningResource({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.type,
    required this.url,
  });

  /// Returns the appropriate icon based on the resource type.
  IconData get icon {
    switch (type) {
      case ResourceType.ppt:
        return Icons.slideshow_rounded;
      case ResourceType.video:
        return Icons.play_circle_fill_rounded;
      case ResourceType.image:
        return Icons.image_rounded;
    }
  }

  /// Returns the brand-specific color.
  Color get brandColor {
    switch (type) {
      case ResourceType.ppt:
        return const Color(0xFFE46A4B); // PPT Orange
      case ResourceType.video:
        return const Color(0xFFE53935); // Video Red
      case ResourceType.image:
        return const Color(0xFF1E88E5); // Image Blue
    }
  }

  /// Returns the button text based on type.
  String get actionText => type == ResourceType.video ? "Watch" : "Open";
}
