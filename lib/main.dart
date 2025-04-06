import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          const Color.fromARGB(255, 202, 87, 228),
          const Color.fromARGB(255, 87, 181, 228),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
