import 'package:flutter/material.dart';

/// A screen demonstrating responsive UI design using MediaQuery for screen
/// size detection and LayoutBuilder for conditional layout rendering.
class ResponsiveDesignDemo extends StatelessWidget {
  const ResponsiveDesignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery provides the full screen dimensions, useful for sizing
    // widgets as a percentage of the overall display.
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Design Demo'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display detected screen dimensions.
              Text(
                'Screen: ${screenWidth.toStringAsFixed(0)} × ${screenHeight.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              // ---- MEDIAQUERY-BASED CONTAINER ----
              // Width is set to 80% of screen width, adapting to any device.
              Center(
                child: Container(
                  width: screenWidth * 0.8,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Width = 80% of screen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Divider(thickness: 2),
              const SizedBox(height: 16),

              // ---- LAYOUTBUILDER SECTION ----
              // LayoutBuilder provides the constraints of the parent widget,
              // letting us switch between mobile and tablet layouts dynamically.
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return _buildMobileLayout(screenWidth);
                  } else {
                    return _buildTabletLayout();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Mobile layout (< 600px): single column with a centered card.
  Widget _buildMobileLayout(double screenWidth) {
    return Column(
      children: [
        const Text(
          'Mobile Layout',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          width: screenWidth * 0.8,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android, color: Colors.white, size: 32),
              SizedBox(height: 8),
              Text(
                'Single Column View',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Tablet layout (≥ 600px): side-by-side panels using Row.
  Widget _buildTabletLayout() {
    return Column(
      children: [
        const Text(
          'Tablet Layout',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Tablet Left Panel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Tablet Right Panel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
