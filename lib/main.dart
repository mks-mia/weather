import 'package:flutter/material.dart';
import 'package:weather_final_project/first_screen.dart';
import 'package:weather_final_project/utility/MyStyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: SplashScreen(),
    );
  }
}

