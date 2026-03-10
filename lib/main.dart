import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/second_screen.dart';
import 'screens/responsive_layout.dart';
import 'screens/scrollable_views.dart';
import 'screens/user_input_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const TracklancerApp());
}

class TracklancerApp extends StatelessWidget {
  const TracklancerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Named routes enable navigation by route name using Navigator.pushNamed.
    return MaterialApp(
      title: "Tracklancer",
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/second': (context) => const SecondScreen(),
        '/responsive-layout': (context) => const ResponsiveLayout(),
        '/scrollable-views': (context) => const ScrollableViews(),
        '/user-input-form': (context) => const UserInputForm(),
      },
    );
  }
}
