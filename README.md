# Rick & Morty Characters App

A Flutter application that consumes the [Rick and Morty API](https://rickandmortyapi.com/) to display a list of characters with infinite scroll, search functionality, character details, and a favorites system with local persistence.

---

## Features

- Characters List
  - Displays character avatar, name, and species
  - Infinite scroll pagination
  - Search characters by name using API filtering

- Character Detail Screen
  - Hero animation between list and detail
  - Extended information: origin, last known location, and episodes
  - Favorite / unfavorite character

-  Favorites
  - Mark and unmark characters as favorites
  - Favorites are persisted locally using Hive
  - Favorites filter available in the main list
  - UI updates instantly without reload

---

## Architecture

This project follows a feature-first, layered architecture inspired by Clean Architecture principles:

lib/
├─ core/
│ ├─ constants/
│ ├─ dio/
│ ├─ errors/
│ ├─ network/
│ ├─ storage/
│ └─ utils/
│
├─ features/
│ ├─ characters/
│ │ ├─ data/
│ │ │ ├─ datasources/
│ │ │ ├─ mappers/
│ │ │ ├─ models/
│ │ │ └─ repositories/
│ │ ├─ domain/
│ │ │ ├─ entities/
│ │ │ └─ repositories/
│ │ └─ presentation/
│ │ ├─ pages/
│ │ ├─ providers/
│ │ └─ widgets/
│ │
│ ├─ favorites/
│ │ └─ providers/
│ │
│ └─ providers/ (shared providers)



### Layer responsibilities

- Data: API consumption, DTOs, serialization, mappers
- Domain: Entities and repository contracts
- Presentation: UI, state management, providers, and widgets
- Core: Shared utilities, networking, error handling, storage, and constants

---

## Main Libraries Used

- Flutter
- flutter_riverpod – State management
- dio – HTTP client
- json_serializable – Typed data models & JSON mapping
- hive – Local persistence for favorites
- error lens – Code quality and linting
https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens

---

## Getting Started

### Prerequisites

- Flutter SDK `3.29.2` (stable)
- Dart SDK compatible with Flutter 3.29
- Android Studio / VS Code
- Android SDK or Xcode (for iOS)

### Environment

The project was tested with:

Flutter 3.29.2 (stable)
Android SDK 36.1.0
Android Studio 2025.2
Xcode 14.3.1
macOS 14.5 (Apple Silicon)


### Instalation
use this for JSON serialization:

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run



