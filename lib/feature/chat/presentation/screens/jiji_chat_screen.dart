import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_provider.dart';
import '../widgets/jiji_avatar.dart';
import '../widgets/learning_resource_card.dart';

class JijiChatScreen extends ConsumerWidget {
  const JijiChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resources = ref.watch(filteredResourcesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const JijiHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(ref),
              const SizedBox(height: 24),
              _buildJijiResponse(resources),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Container(
      // Added a specific height to the container to ensure the bar looks consistent
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ), // Matches image's softer corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.05,
            ), // Matches subtle shadow in image
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        // Center helps align the text and icons vertically
        child: TextField(
          onChanged: (val) =>
              ref.read(searchQueryProvider.notifier).state = val,
          textAlignVertical:
              TextAlignVertical.center, // Vertically aligns input text
          decoration: InputDecoration(
            hintText: "Explain RAG",
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 28),
            // Suffix icon setup to fit the height correctly
            suffixIcon: Container(
              margin: const EdgeInsets.only(
                right: 8,
              ), // Small padding from the edge
              padding: const EdgeInsets.all(
                12,
              ), // Controls the size of the icon within the area
              child: Image.asset(
                'assets/images/send_icon.png',
                fit: BoxFit.contain, // Ensures the icon doesn't stretch
              ),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildJijiResponse(List resources) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Slightly sharper corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Jiji says",
            style: TextStyle(
              fontWeight: FontWeight.w700, // Thicker font
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: "Retrieval-Augmented Generation (RAG) ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const TextSpan(
                  text:
                      "combines search with large language models to improve the accuracy of generated answers by providing relevant information from external data sources.",
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Add the bullet points seen in the image
          _buildBulletPoint("Retrieves data from external sources"),
          _buildBulletPoint(
            "Uses a language model to generate answers using this data",
          ),
          _buildBulletPoint("Enhances the accuracy of responses"),
          const SizedBox(height: 12),
          // List of resource cards
          ...resources.map((res) => LearningResourceCard(resource: res)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(" • ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
