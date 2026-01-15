import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/resource_model.dart';

/// StateProvider for the search bar text.
final searchQueryProvider = StateProvider<String>((ref) => "");

/// Memoized provider for the filtered resource list.
final filteredResourcesProvider = Provider<List<LearningResource>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();

  final allResources = [
    LearningResource(
      title: "Presentation on RAG",
      subtitle: "PowerPoint Presentation",
      imagePath: "assets/images/pp_logo.png", // Added required argument
      type: ResourceType.ppt,
      url: "https://example.com/rag-ppt",
    ),
    LearningResource(
      title: "What is RAG? Retrieval-Augmented...",
      subtitle: "YouTube Video",
      imagePath: "assets/images/yt_logo.png", // Added required argument
      type: ResourceType.video,
      url: "https://youtube.com/rag-video",
    ),
  ];

  if (query.isEmpty) return allResources;

  return allResources
      .where(
        (r) =>
            r.title.toLowerCase().contains(query) ||
            r.subtitle.toLowerCase().contains(query),
      )
      .toList();
});
