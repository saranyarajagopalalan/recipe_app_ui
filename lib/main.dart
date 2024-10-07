import 'package:flutter/material.dart';
import 'package:recipe_app/utils/theme/theme.dart';
import 'package:recipe_app/widgets/animated_bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.cyan),
      themeMode: ThemeMode.system,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      title: 'Recipe Application ui design',
      debugShowCheckedModeBanner: false,
      home: const bottonavbar(),
    );
  }
}
