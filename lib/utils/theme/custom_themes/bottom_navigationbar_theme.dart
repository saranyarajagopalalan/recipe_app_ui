import 'package:flutter/material.dart';

class TBottomNavBarTheme {
  TBottomNavBarTheme._();

  static final lightBottomNavBarTheme = BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromRGBO(30, 162, 109, 1),
      unselectedItemColor: Colors.grey[200]);

  static final darkBottomNavBarTheme = BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: const Color.fromRGBO(30, 162, 109, 1),
      unselectedItemColor: Colors.grey[200]);
}
