import 'package:flutter/material.dart';


const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF4A54B8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE0E0FF),
  onPrimaryContainer: Color(0xFF000569),
  secondary: Color(0xFF6238E8),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE6DEFF),
  onSecondaryContainer: Color(0xFF1D0061),
  tertiary: Color(0xFF3458B9),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFDBE1FF),
  onTertiaryContainer: Color(0xFF00174C),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  onSurfaceVariant: Color(0xFF46464F),
  outline: Color(0xFF777680),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFFBEC2FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4A54B8),
  outlineVariant: Color(0xFFC7C5D0),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFBEC2FF),
  onPrimary: Color(0xFF172088),
  primaryContainer: Color(0xFF313A9F),
  onPrimaryContainer: Color(0xFFE0E0FF),
  secondary: Color(0xFFCBBEFF),
  onSecondary: Color(0xFF320099),
  secondaryContainer: Color(0xFF490AD1),
  onSecondaryContainer: Color(0xFFE6DEFF),
  tertiary: Color(0xFFB4C5FF),
  onTertiary: Color(0xFF002979),
  tertiaryContainer: Color(0xFF143FA0),
  onTertiaryContainer: Color(0xFFDBE1FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  onSurfaceVariant: Color(0xFFC7C5D0),
  outline: Color(0xFF91909A),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFF4A54B8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFBEC2FF),
  outlineVariant: Color(0xFF46464F),
  scrim: Color(0xFF000000),
);

const customColorScheme = CustomColors(
  success: Color(0xFF42E716),
  warning: Color(0xFFFFCC70),
  white: Color(0xFFFFFFFF),
);

@immutable
class CustomColors {
  const CustomColors({
    required this.success,
    required this.warning,
    required this.white,
  });

  final Color success;
  final Color warning;
  final Color white;
}
