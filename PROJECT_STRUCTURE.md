# Flutter Project Structure

## Introduction

A Flutter project is automatically generated with several folders and configuration files that help organize application code, assets, platform settings, and dependencies. Understanding the role of these folders makes it easier to manage large applications and work efficiently in teams.

---

# Main Project Folders

## lib/

This is the main folder where all Dart source code is written.

Example structure:

```
lib/
├── main.dart
├── screens/
├── widgets/
├── services/
└── models/
```

* **main.dart** → Entry point of the Flutter application.
* **screens/** → Contains UI screens of the app.
* **widgets/** → Reusable UI components.
* **services/** → Business logic, APIs, or Firebase services.
* **models/** → Data models used across the app.

---

## android/

Contains configuration files required to build the Android version of the Flutter application.

Important files:

* **build.gradle** → Defines dependencies and build settings
* **AndroidManifest.xml** → App permissions and configuration

---

## ios/

Contains configuration and build files required for iOS development.

Important file:

* **Info.plist** → Defines metadata and permissions for the iOS application.

---

## assets/

This folder stores static files such as:

* Images
* Fonts
* JSON data
* Icons

Assets must be declared inside **pubspec.yaml** before they can be used in the app.

Example:

```
flutter:
  assets:
    - assets/images/
```

---

## test/

Contains automated test files used for verifying application logic and UI components.

Flutter automatically generates a sample test file called:

```
widget_test.dart
```

---

# Important Configuration Files

## pubspec.yaml

This is the most important configuration file in a Flutter project.

It is used to:

* Manage dependencies
* Register assets
* Define fonts
* Configure project settings

Example:

```
dependencies:
  flutter:
    sdk: flutter
```

---

## README.md

Contains project documentation including setup instructions, usage information, and development notes.

---

## .gitignore

Lists files and folders that Git should ignore, such as build outputs and system files.

---

# Reflection

Understanding the Flutter project structure helps developers organize their code efficiently. A clear structure makes it easier to manage large projects, collaborate with team members, and maintain scalable applications.

By separating UI components, services, and data models into different folders, developers can maintain clean architecture and improve project readability.
