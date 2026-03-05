1️⃣ Flutter Architecture 
Framework Layer 

Material widgets

HTTP package

State management

UI screens (Dashboard, Login, Project list)

Engine Layer

Handles rendering your dashboard UI efficiently.

You don’t directly interact with this — but it ensures your API-fetched data renders smoothly.

Embedder Layer

This allows:

Internet access

Secure token storage

Platform-specific permissions


2️⃣ Widget Tree (Applied to Your App)

Your actual widget tree probably looks like:

MaterialApp
 └── AuthWrapper
      ├── LoginScreen
      └── DashboardScreen
            ├── DeadlineList
            │     └── ListView
            │           └── DeadlineCard
            └── BottomNavigationBar



3️⃣ Where Flutter Actually Matters in Your App

Flutter matters in:

Efficient rendering of dynamic deadline lists

Smooth UI updates when API data arrives

Managing loading states

Showing error states

Example:

When you fetch data:

Future<void> fetchDeadlines() async {
  final response = await http.get(...);
  setState(() {
    deadlines = parsedData;
  });
}

Key idea:

Flutter rebuilds the UI when API data arrives.

That’s reactive programming in action.

4️⃣ Dart Concepts That ACTUALLY Matter For You


✅ Async / Await

You cannot fetch APIs without this.

✅ Futures

API calls return Future objects.

✅ JSON parsing

Converting response body to Dart objects.

✅ Null safety

Because API responses can contain null fields.



..

.
