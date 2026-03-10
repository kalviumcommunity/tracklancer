import 'package:flutter/material.dart';

/// HomeScreen demonstrates navigation using Navigator.pushNamed
/// with named routes and passing data (arguments) to the next screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the Home Screen',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed navigates to a route by its name.
                    // The 'arguments' parameter passes data to the target screen.
                    Navigator.pushNamed(
                      context,
                      '/second',
                      arguments: 'Hello from Home Screen!',
                    );
                  },
                  child: const Text('Go to Second Screen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
