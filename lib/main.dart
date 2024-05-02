import 'package:flutter/material.dart';
import './widgets/animated_bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: 'Recipe Application ui design',
      debugShowCheckedModeBanner: false,
      home: const bottonavbar(),
    );
  }
}
