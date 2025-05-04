import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    useMaterial3: true,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
