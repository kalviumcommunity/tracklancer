import 'package:flutter/material.dart';

// =============================================================================
// DEBUG TOOLS DEMO SCREEN
// Demonstrates three core Flutter developer tools:
//   1. Hot Reload  — modify the greeting text and save to see instant changes
//   2. Debug Console — debugPrint() logs appear in the console on button tap
//   3. DevTools Inspector — nested widget tree for Widget Inspector exploration
// =============================================================================

/// Entry screen combining all three demo sections.
class DebugToolsDemo extends StatelessWidget {
  const DebugToolsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Debug Tools Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---- 1️⃣ HEADER SECTION ----
              _HeaderSection(),
              SizedBox(height: 20),

              // ---- 2️⃣ HOT RELOAD DEMO ----
              _HotReloadSection(),
              SizedBox(height: 20),

              // ---- 3️⃣ DEBUG CONSOLE DEMO ----
              DebugCounterWidget(),
              SizedBox(height: 20),

              // ---- 4️⃣ DEVTOOLS INSPECTION DEMO ----
              _DevToolsInspectionSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// 1️⃣  HEADER — static description of the demo
// =============================================================================

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: const Text(
        'Demonstration of Hot Reload, Debug Console logging, '
        'and Flutter DevTools.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// =============================================================================
// 2️⃣  HOT RELOAD DEMO
// To try: change the greeting text below, save the file, and observe the UI
// update instantly without restarting the app.
// =============================================================================

class _HotReloadSection extends StatelessWidget {
  const _HotReloadSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade400, Colors.teal.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Icon(Icons.flash_on, size: 36, color: Colors.white),
          SizedBox(height: 8),
          Text(
            'Hot Reload Demo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          // ⚡ HOT RELOAD: Change this text, save the file, and see
          //   the UI update instantly without losing app state.
          Text(
            'Hello Flutter Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try changing the text above, save the file,\n'
            'and watch Hot Reload update the UI instantly.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 3️⃣  DEBUG CONSOLE DEMO (StatefulWidget)
// Each button press increments a counter and prints a log via debugPrint().
// Open the Debug Console to see the output.
// =============================================================================

/// A counter widget that logs every increment to the Debug Console
/// using [debugPrint].
class DebugCounterWidget extends StatefulWidget {
  const DebugCounterWidget({super.key});

  @override
  State<DebugCounterWidget> createState() => _DebugCounterWidgetState();
}

class _DebugCounterWidgetState extends State<DebugCounterWidget> {
  int _count = 0;

  void _increaseCounter() {
    setState(() {
      _count++;
    });
    // 🖥️ DEBUG CONSOLE: This message appears in the Debug Console
    //   when the app is running in debug mode.
    debugPrint('Counter increased to $_count');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          const Icon(Icons.terminal, size: 32, color: Colors.teal),
          const SizedBox(height: 8),
          const Text(
            'Debug Console Demo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Debug Counter: $_count',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _increaseCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increase Counter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Open the Debug Console to see debugPrint() output.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// 4️⃣  DEVTOOLS INSPECTION DEMO
// A deliberately nested widget tree so developers can explore it in the
// Flutter DevTools Widget Inspector.
// =============================================================================

class _DevToolsInspectionSection extends StatelessWidget {
  const _DevToolsInspectionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 DEVTOOLS: Open Flutter DevTools → Widget Inspector to
          //   explore this nested widget hierarchy.
          const Center(
            child: Column(
              children: [
                Icon(Icons.account_tree, size: 32, color: Colors.teal),
                SizedBox(height: 8),
                Text(
                  'DevTools Inspection Demo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Inspect this nested widget tree using\n'
                  'Flutter DevTools → Widget Inspector.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Nested widget tree for inspection
          const Row(
            children: [
              Icon(Icons.code, color: Colors.teal),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Row → Icon + Text (nested in Column)',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              leading: Icon(Icons.layers, color: Colors.teal),
              title: Text('Card → ListTile'),
              subtitle: Text(
                'This nested structure is visible in DevTools Widget Inspector.',
              ),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.widgets, color: Colors.teal, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Deeply nested widgets',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Card → Padding → Column → Row → Icon + Text\n'
                    'Select any widget in DevTools to see its properties.',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
