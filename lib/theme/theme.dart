import 'package:flutter/material.dart';

import '../constants/constants.dart';

ThemeData lightMode = ThemeData(
  drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
  colorScheme: ColorScheme.light(
    background: Colors.teal.shade50,
    primary: const Color(0xff27c1a9),
    secondary: Colors.teal.shade200,
  ),
  brightness: Brightness.light,
);

ThemeData darkMode = ThemeData(
  drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  brightness: Brightness.dark,
);

ThemeData newTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: kPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);
