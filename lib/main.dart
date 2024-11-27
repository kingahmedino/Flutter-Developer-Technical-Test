import 'package:flutter/material.dart';
import 'package:nouns_app_demo/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Vanilla Extract',
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
