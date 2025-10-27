# 🌍 Flutter Web — Trip List (Pixel-Perfect to Figma)

**A responsive Flutter Web screen that displays a list of trips — pixel-perfect to the provided Figma design.**  
Built using clean architecture (Data / Domain / Presentation) and Riverpod + MVVM pattern.  
Deployed live using Firebase Hosting.

---

## 🔗 Live Preview

👉 **Live URL:** [https://trips-task-28e40.web.app/](https://trips-task-28e40.web.app/)

Visit the link above to preview the hosted Flutter Web app.

---

## 🚀 Project Overview

This project implements a responsive web screen that matches the Figma design exactly — including fonts, colors, spacing, and overall layout.  
It follows scalable **clean architecture** principles and includes all three layers:

- **Data** — Models, repositories, and local data source (using `trips_mock.json`).
- **Domain** — Entities and use cases.
- **Presentation** — UI, ViewModels, and Riverpod state management.

---

## ✅ Features

- 🎨 Pixel-perfect Figma implementation  
- 🧱 Clean Architecture (Data / Domain / Presentation)  
- 💾 Local JSON asset (`trips_mock.json`) as data source  
- 🌗 Centralized imports via `app_exports.dart`  
- 📱 Responsive layout for various screen sizes  
- ⚡ Firebase Hosting Deployment  
- 🧩 Supports Riverpod + MVVM + get_it DI pattern  

---

## 📦 Dependencies

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
