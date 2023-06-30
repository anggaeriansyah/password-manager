// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:password_manager/pages/homePage.dart';
// import 'controller/theme_state.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green[600],
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, // Tema light mode
      darkTheme: darkTheme, // Set tema sesuai status saat ini
      home: HomePage(),
    );
  }
}
