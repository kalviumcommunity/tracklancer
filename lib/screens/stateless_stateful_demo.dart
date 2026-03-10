import 'package:flutter/material.dart';

// =============================================================================
// MAIN DEMO SCREEN
// Combines a StatelessWidget (StaticHeader) and a StatefulWidget
// (InteractiveCounter) to clearly demonstrate their differences.
// =============================================================================

/// Entry screen that lays out both widget types inside a Scaffold.
class StatelessStatefulDemo extends StatelessWidget {
  const StatelessStatefulDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless vs Stateful Demo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- SECTION 1: StatelessWidget ---
              StaticHeader(),

              SizedBox(height: 12),
              Divider(thickness: 1.5),
              SizedBox(height: 12),

              // --- SECTION 2: StatefulWidget ---
              InteractiveCounter(),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// SECTION 1 — STATELESS WIDGET
// This widget receives data once and never changes during its lifetime.
// It has no mutable state and no setState() call.
// =============================================================================

/// A static header that displays a fixed title, subtitle, and icon.
/// Because it extends [StatelessWidget], its UI cannot change after it is built.
class StaticHeader extends StatelessWidget {
  const StaticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.indigo, Colors.indigoAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          Icon(Icons.widgets_outlined, size: 48, color: Colors.white),
          SizedBox(height: 12),
          Text(
            'Interactive Counter App',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'This header is a StatelessWidget.\n'
            'It displays static content that never changes at runtime.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// SECTION 2 — STATEFUL WIDGET
// This widget holds mutable state (_counter, _isBlue).  When the user taps
// a button, setState() is called, which triggers a rebuild with the new values.
// =============================================================================

/// An interactive counter that demonstrates [setState].
/// Each button press mutates internal state and the framework rebuilds the UI.
class InteractiveCounter extends StatefulWidget {
  const InteractiveCounter({super.key});

  @override
  State<InteractiveCounter> createState() => _InteractiveCounterState();
}

class _InteractiveCounterState extends State<InteractiveCounter> {
  // Mutable state variables — changing these via setState() causes a rebuild.
  int _counter = 0;
  bool _isBlue = true; // controls the text‑color toggle

  /// Increments the counter by 1 and rebuilds the widget.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Resets the counter back to 0.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  /// Toggles the counter text color between blue and red.
  void _toggleColor() {
    setState(() {
      _isBlue = !_isBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          // Label identifying this section
          const Text(
            'StatefulWidget Section',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tap the buttons below — setState() rebuilds the UI.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),

          const SizedBox(height: 24),

          // ---- Counter display ----
          Text(
            'Counter Value: $_counter',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              // Color changes dynamically based on _isBlue state.
              color: _isBlue ? Colors.indigo : Colors.red,
            ),
          ),

          const SizedBox(height: 24),

          // ---- Increment button ----
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increase Counter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ---- Reset button ----
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Counter'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.indigo),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 12),

          // ---- Color toggle interaction ----
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Text Color: ${_isBlue ? "Blue" : "Red"}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _isBlue ? Colors.indigo : Colors.red,
                  ),
                ),
              ),
              Switch(
                value: _isBlue,
                activeColor: Colors.indigo,
                inactiveTrackColor: Colors.red[200],
                onChanged: (_) => _toggleColor(),
              ),
            ],
          ),
          Text(
            'Toggle the switch to change the counter text color.\n'
            'This uses setState() to update _isBlue.',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
