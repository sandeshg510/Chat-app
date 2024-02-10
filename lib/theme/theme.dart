import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.teal.shade50,
    primary: Colors.teal.shade300,
    secondary: Colors.teal.shade200,
  ),
  brightness: Brightness.light,
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  brightness: Brightness.dark,
);
