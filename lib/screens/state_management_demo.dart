import 'package:flutter/material.dart';

/// A demo screen showing local UI state management using StatefulWidget
/// and setState(). The counter value drives UI updates and conditional styling.
class StateManagementDemo extends StatefulWidget {
  const StateManagementDemo({super.key});

  @override
  State<StateManagementDemo> createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  // State variable — changing this value and calling setState() triggers a rebuild.
  int _counter = 0;

  /// Increments the counter. setState() tells Flutter to re-run build()
  /// so the UI reflects the updated value.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Decrements the counter, but never below zero.
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Button pressed:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),

                // The counter text rebuilds with the latest _counter value
                // each time setState() is called.
                Text(
                  '$_counter times',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // Row with increment and decrement buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('Increment'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: const Text('Decrement'),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Conditional UI — the container color changes based on state.
                // This shows how setState() drives dynamic visual feedback.
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _counter >= 5 ? Colors.greenAccent : Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Count: $_counter',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
