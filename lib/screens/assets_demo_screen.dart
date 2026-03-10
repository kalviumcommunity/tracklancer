import 'package:flutter/material.dart';

/// A demo screen showing how to load and display local assets (images and icons)
/// in a Flutter application using Image.asset, AssetImage, and Material Icons.
class AssetsDemoScreen extends StatelessWidget {
  const AssetsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets Demo'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ---- IMAGE DISPLAY ----
              // Image.asset loads an image registered in pubspec.yaml
              // from the local assets folder.
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // ---- TEXT SECTION ----
              const Text(
                'Powered by Flutter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // ---- ICONS SECTION ----
              // Flutter provides built-in Material icons via the Icons class.
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flutter_dash, color: Colors.blue, size: 36),
                  SizedBox(width: 24),
                  Icon(Icons.android, color: Colors.green, size: 36),
                  SizedBox(width: 24),
                  Icon(Icons.apple, color: Colors.grey, size: 36),
                ],
              ),

              const SizedBox(height: 24),
              const Divider(thickness: 2),
              const SizedBox(height: 16),

              // ---- BACKGROUND IMAGE EXAMPLE ----
              // AssetImage can be used inside BoxDecoration to set a
              // container background from a local asset.
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Background Image Demo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ---- ASSET ICONS ROW ----
              // Loading custom icon assets from the assets/icons/ folder.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/star.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 24),
                  Image.asset(
                    'assets/icons/profile.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
