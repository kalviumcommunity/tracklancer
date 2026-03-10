import 'package:flutter/material.dart';
import 'screens/responsive_home.dart';

void main() {
  runApp(const TracklancerApp());
}

class TracklancerApp extends StatelessWidget {
  const TracklancerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracklancer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveHome(),
    );
  }
}
