import 'package:flutter/material.dart';
import '../../domain/resource_model.dart';

class LearningResourceCard extends StatelessWidget {
  final LearningResource resource;

  const LearningResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    // Determine button color based on action text to match screenshot
    final buttonColor = resource.actionText == "Watch"
        ? const Color(0xFF4A90B2) // Blue for Watch
        : const Color(0xFF4DB6AC); // Teal for Open

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(
          0xFFF9FAFB,
        ), // Matches the light grey tile background in the image
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(
          16,
        ), // Softer corners to match the UI
      ),
      child: Row(
        children: [
          // PNG Image Asset for Brand Logos (PowerPoint/YouTube)
          SizedBox(
            width: 44,
            height: 44,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                resource
                    .imagePath, // Ensure your model uses imagePath instead of icon
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.insert_drive_file,
                  color: resource.brandColor,
                  size: 36,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resource.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  resource.subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          // Action Button
          SizedBox(
            height: 34,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                resource.actionText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
