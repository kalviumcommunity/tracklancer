import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

/// A demo screen showing how a single reusable widget (CustomButton) can be
/// used multiple times with different properties, promoting modular UI design.
class CustomWidgetDemo extends StatelessWidget {
  const CustomWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable Custom Widgets'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Each CustomButton below reuses the same widget class
                // but with different label, color, and callback properties.

                CustomButton(
                  label: 'Primary Action',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Primary Action pressed!')),
                    );
                  },
                ),

                const SizedBox(height: 16),

                CustomButton(
                  label: 'Secondary Action',
                  color: Colors.orange,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Secondary Action pressed!')),
                    );
                  },
                ),

                const SizedBox(height: 16),

                CustomButton(
                  label: 'Navigate Back',
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
