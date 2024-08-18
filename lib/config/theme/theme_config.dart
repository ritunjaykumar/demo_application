import 'package:demo_application/config/theme/text_style_config.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.light),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black,brightness: Brightness.dark),
);
