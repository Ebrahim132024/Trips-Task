# Flutter Web — Trip List (Pixel-Perfect to Figma)

**A responsive Flutter Web screen that displays a list of trips — pixel-perfect to the provided Figma design.**  
Built with scalable clean architecture (Data / Domain / Presentation). Riverpod + MVVM friendly. Includes instructions to run locally and deploy to Firebase Hosting.

---

## 🚀 Project Overview

This project implements a single responsive Flutter web screen that matches the provided Figma design exactly (colors, fonts, spacing, assets). It follows a scalable clean architecture split into three layers:

- **Data** — local data source (`assets/trips_mock.json`), models, and repositories.
- **Domain** — entities and use-cases (business rules).
- **Presentation** — UI, view models (MVVM), and state management.

State management is pluggable — Riverpod + MVVM is recommended (and implemented as an example). The repo uses an `app_exports.dart` barrel file to centralize common imports / theme / colors / utilities.

---

## ✅ Features

- Pixel-perfect UI matching Figma (fonts, assets, colors).
- Fully responsive for different screen sizes and resizes.
- Clean architecture (Data / Domain / Presentation).
- Local JSON data source (`trips_mock.json`) included as an asset.
- Example MVVM + Riverpod integration (recommended).
- Uses `app_exports.dart` to centralize exports.
- Built for Flutter Web and deployed via Firebase Hosting.

---

## 📦 Dependencies

Add the following to `pubspec.yaml` under `dependencies:`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get_it: ^7.6.4
  freezed_annotation: ^2.4.1
  json_annotation: ^4.9.0
  dartz: ^0.10.1
  google_fonts: ^5.0.0
  cached_network_image: ^3.2.3
  intl: ^0.18.0
  flutter_riverpod: ^2.0.0
  equatable: ^2.0.5
  provider: ^6.1.5+1
  lucide_icons_flutter: ^3.1.5
