import 'package:flutter/material.dart';

/// A reusable button widget with consistent styling.
/// Accepts a label, callback, and optional color to allow flexible reuse
/// across multiple screens without duplicating layout code.
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.teal,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
