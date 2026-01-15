# Jiji AI Friend 🤖

A sleek, modern AI-companion interface built with Flutter. This project demonstrates high-fidelity UI implementation, reactive state management with Riverpod, and a tech-centric aesthetic.



## 🚀 How AI Propelled This Work

The development of this screen was an exercise in **iterative prompt engineering** and **rapid prototyping**. Instead of manual layout coding, AI was used as an intelligent pair programmer to:

* **Visual Translation**: AI converted a static design screenshot into functional Flutter code by identifying specific UI components like the translucent glow behind the avatar.
* **Asset Generation**: When unique icons were needed, AI generated high-resolution transparent assets (like the teal send arrow and stylized brand logos) to match the design's specific aesthetic.
* **State Management Orchestration**: AI helped architect a reactive system using **Riverpod**, creating a `searchQueryProvider` and a memoized `filteredResourcesProvider` for real-time search.
* **Refined Typography**: AI suggested using `RichText` widgets to handle complex inline styling for technical terms within the summary text.

---

## ✨ Key UI Features

* **Dynamic Avatar Header**: Uses a `Stack` to layer a subtle blue glow behind a transparent character image. A cyan tech-accent is positioned precisely on the character's collar.
* **Glassmorphic Search Bar**: A white search bar with a `0.05` opacity shadow to create depth without visual clutter. It features a vertically centered layout for a premium feel.
* **Smart Resource Cards**: Action buttons dynamically change color based on the resource type—**Teal (#4DB6AC)** for documents and **Steel Blue (#4A90B2)** for videos.
* **Contextual Summary**: Jiji provides a bulleted breakdown of technical concepts using a custom-built row widget for clean alignment.

---

## 🛠 Technical Architecture

### State Management (Riverpod)
The app uses a reactive provider pattern to filter resources in real-time based on user input:
* **`searchQueryProvider`**: Tracks the current input in the search field.
* **`filteredResourcesProvider`**: A memoized provider that filters the `LearningResource` list based on the search query.

### File Structure
| File | Responsibility |
| :--- | :--- |
| `resource_model.dart` | Defines the `LearningResource` data structure and brand logic. |
| `chat_provider.dart` | Manages search state and filtered data lists. |
| `jiji_avatar.dart` | Implements the stylized character header and glow effects. |
| `learning_resource_card.dart` | Renders individual resource tiles with dynamic buttons and brand PNGs. |
| `jiji_chat_screen.dart` | The main layout containing the search bar and response container. |

---

## 📦 Setup & Installation

### 1. Asset Configuration
Ensure your `pubspec.yaml` contains the following image assets:
```yaml
flutter:
  assets:
    - assets/images/jiji_avatar.png
    - assets/images/send_icon.png
    - assets/images/pp_logo.png
    - assets/images/yt_logo.png