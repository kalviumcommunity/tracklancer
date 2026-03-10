# Tracklancer


1️⃣ Flutter Architecture 
Framework Layer 

Material widgets

HTTP package

State management

UI screens (Dashboard, Login, Project list)

Engine Layer

Handles rendering your dashboard UI efficiently.


Embedder Layer

This allows:

Internet access

Secure token storage

Platform-specific permissions


3️⃣ Where Flutter Actually Matters in Your App

Flutter matters in:

Efficient rendering of dynamic deadline lists

Smooth UI updates when API data arrives

Managing loading states

Showing error states


Key idea:

Flutter rebuilds the UI when API data arrives.

That’s reactive programming in action.

✅ Async / Await

You cannot fetch APIs without this.

✅ Futures

API calls return Future objects.

✅ JSON parsing

Converting response body to Dart objects.

✅ Null safety

### 3.10
## Firebase Setup

1. Created a Firebase project in Firebase Console
2. Added Flutter Android app
3. Downloaded `google-services.json`
4. Ran:

flutterfire configure

## Dependencies

firebase_core  
firebase_auth  
cloud_firestore

## Authentication Implementation

User authentication is handled using Firebase Authentication.

Example:

Future<User?> signUp(String email, String password) async {
  final credential =
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential.user;
}

Features implemented:

• Signup screen  
• Login screen  
• Navigation after successful login

## Firestore Integration

Firestore is used for storing user data.

Example:

Future<void> addUserData(String uid, Map<String, dynamic> data) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set(data);
}

CRUD operations implemented:

• Create data  
• Read data  
• Update data  
• Delete data  

## Testing

The application was tested by:

• Creating a new user  
• Logging in with the created account  
• Adding and retrieving Firestore data  
• Verifying records in Firebase Console


## Learning

This task helped understand:

• Connecting Flutter with Firebase  
• Implementing secure authentication  
• Using Cloud Firestore for real-time database storage  
• Building cloud-connected mobile applications



### 3.11
# Flutter Environment Setup and First App Run

## Overview

This task involved setting up the Flutter development environment and running the first Flutter application on an emulator. The setup ensures that Flutter, Android Studio/VS Code, and the emulator are properly configured for mobile app development.

---

# Setup Steps

### 1. Install Flutter SDK

* Downloaded Flutter SDK from the official Flutter website
* Extracted the SDK to the local system
* Added Flutter to the system PATH

Verified installation using:

```
flutter doctor
```

---

### 2. Development Environment Setup

Installed required development tools:

* Android Studio / VS Code
* Flutter extension
* Dart extension

These tools provide support for Flutter development and debugging.

---

### 3. Emulator Configuration

Steps followed:

1. Open Android Studio
2. Go to **AVD Manager**
3. Create Virtual Device
4. Selected **Pixel Device**
5. Installed Android system image
6. Launched emulator

Verified emulator detection using:

```
flutter devices
```

---

### 4. Running First Flutter App

Created a new Flutter project:

```
flutter create first_flutter_app
```

Ran the project using:

```
flutter run
```

The default Flutter counter application successfully launched on the emulator.


---

# Reflection

During the setup process, the main challenge was configuring the development environment and ensuring all dependencies were correctly installed. Running `flutter doctor` helped identify missing components and verify the installation.

This setup provides a complete environment for building, testing, and debugging Flutter applications, which will be used in upcoming tasks such as UI development and Firebase integration.


