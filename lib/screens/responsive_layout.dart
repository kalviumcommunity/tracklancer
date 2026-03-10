import 'package:flutter/material.dart';

/// A screen demonstrating responsive UI layout using Container, Row, and Column.
/// Uses MediaQuery to adapt between phone (stacked) and tablet (side-by-side)
/// layouts at a 600px breakpoint.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery provides the current screen dimensions so we can adapt layout.
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout Demo'),
      ),
      body: SafeArea(
        // Container wraps the entire body with consistent padding.
        child: Container(
          padding: const EdgeInsets.all(16),
          // Column arranges the header and content sections vertically.
          child: Column(
            children: [
              // ---- HEADER SECTION ----
              // A full-width Container used as a visual header block.
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Header Section',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ---- MAIN CONTENT SECTION ----
              // Expanded fills the remaining vertical space so there is no overflow.
              Expanded(
                // Switch between Row (wide) and Column (narrow) based on screen width.
                child: screenWidth >= 600
                    ? _buildWideLayout()
                    : _buildNarrowLayout(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Wide layout (≥ 600px): Row places the two panels side-by-side.
  Widget _buildWideLayout() {
    return Row(
      children: [
        // Expanded makes each panel share the available horizontal space equally.
        Expanded(child: _buildPanel('Left Panel', Colors.teal)),
        const SizedBox(width: 10),
        Expanded(child: _buildPanel('Right Panel', Colors.deepOrange)),
      ],
    );
  }

  /// Narrow layout (< 600px): Column stacks the two panels vertically.
  Widget _buildNarrowLayout() {
    return Column(
      children: [
        // Expanded makes each panel share the available vertical space equally.
        Expanded(child: _buildPanel('Left Panel', Colors.teal)),
        const SizedBox(height: 10),
        Expanded(child: _buildPanel('Right Panel', Colors.deepOrange)),
      ],
    );
  }

  /// Reusable panel widget built with a Container.
  /// Centers a text label over a colored, rounded background.
  Widget _buildPanel(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
