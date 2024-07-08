import 'package:demo_application/config/theme/text_style_config.dart';
import 'package:flutter/material.dart';

import 'color_config.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: textTheme,
  appBarTheme: AppBarTheme(
    color: lightColorScheme.surface,
    scrolledUnderElevation: 0,
    elevation: 0,
    titleTextStyle: textTheme.titleMedium?.copyWith(
      color: lightColorScheme.primary,
    ),
    toolbarTextStyle: textTheme.titleMedium,
    iconTheme: IconThemeData(
      color: lightColorScheme.primary,
    ),
  ),
  cardTheme: CardTheme(
    margin: 12.all,
  ),
  popupMenuTheme: PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: 12.circular,
    ),
    color: lightColorScheme.surface,
    labelTextStyle: WidgetStatePropertyAll(
      textTheme.titleMedium?.copyWith(
        color: lightColorScheme.onSurface,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: lightColorScheme.scrim,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: 12.circular,
    ),
    filled: false,
    contentPadding: 16.all,
    errorMaxLines: 2,
    helperMaxLines: 4,
    helperStyle: textTheme.labelMedium?.copyWith(
      color: lightColorScheme.secondary,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        lightColorScheme.primary,
      ),
      foregroundColor: WidgetStatePropertyAll(
        lightColorScheme.onPrimary,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: 12.circular,
        ),
      ),
    ),
  ),
  dialogBackgroundColor: lightColorScheme.surface,
  dialogTheme: DialogTheme(
    backgroundColor: lightColorScheme.surface,
    shape: RoundedRectangleBorder(borderRadius: 12.circular),
    alignment: Alignment.center,
    actionsPadding: 12.all,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: lightColorScheme.surface,
    constraints: const BoxConstraints(
      maxHeight: 600,
      minHeight: 200,
      maxWidth: double.infinity,
      minWidth: double.infinity,
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: textTheme,
  appBarTheme: AppBarTheme(
    // color: darkColorScheme.scrim,
    titleTextStyle: textTheme.titleMedium,
    toolbarTextStyle: textTheme.titleMedium,
    iconTheme: IconThemeData(
      color: darkColorScheme.onSurface,
    ),
  ),
  cardTheme: CardTheme(
    margin: 12.all,
  ),
  popupMenuTheme: PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: 16.circular,
    ),
    color: darkColorScheme.surface,
    labelTextStyle: WidgetStatePropertyAll(
      textTheme.titleSmall?.copyWith(
        color: darkColorScheme.onSurface,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: darkColorScheme.onSurface,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: 12.circular,
    ),
    filled: true,
    contentPadding: const EdgeInsets.all(16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: 12.circular,
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(
        darkColorScheme.secondary,
      ),
      foregroundColor: WidgetStatePropertyAll(
        darkColorScheme.onSecondary,
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: darkColorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: 12.circular,
    ),
    alignment: Alignment.center,
    actionsPadding: 12.all,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: 12.circular,
        ),
      ),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: darkColorScheme.surface,
  ),
);
