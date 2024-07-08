import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff455e91),
      surfaceTint: Color(4282736273),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292403967),
      onPrimaryContainer: Color(4278196803),
      secondary: Color(4283915889),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292600569),
      onSecondaryContainer: Color(4279507756),
      tertiary: Color(4285617523),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294760443),
      onTertiaryContainer: Color(4280947501),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294638079),
      onSurface: Color(4279900960),
      onSurfaceVariant: Color(4282664783),
      outline: Color(4285888384),
      outlineVariant: Color(4291151568),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4289644287),
      primaryFixed: Color(4292403967),
      onPrimaryFixed: Color(4278196803),
      primaryFixedDim: Color(4289644287),
      onPrimaryFixedVariant: Color(4281091704),
      secondaryFixed: Color(4292600569),
      onSecondaryFixed: Color(4279507756),
      secondaryFixedDim: Color(4290758364),
      onSecondaryFixedVariant: Color(4282337113),
      tertiaryFixed: Color(4294760443),
      onTertiaryFixed: Color(4280947501),
      tertiaryFixedDim: Color(4292852702),
      onTertiaryFixedVariant: Color(4283973210),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280828532),
      surfaceTint: Color(4282736273),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284249257),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282073941),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285363336),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283710038),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287196042),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638079),
      onSurface: Color(4279900960),
      onSurfaceVariant: Color(4282401611),
      outline: Color(4284309351),
      outlineVariant: Color(4286085763),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4289644287),
      primaryFixed: Color(4284249257),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282604431),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285363336),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283718767),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287196042),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285485680),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278198352),
      surfaceTint: Color(4282736273),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280828532),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279968307),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282073941),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281407796),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283710038),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638079),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362027),
      outline: Color(4282401611),
      outlineVariant: Color(4282401611),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4293323775),
      primaryFixed: Color(4280828532),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279053148),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282073941),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280626494),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283710038),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282131519),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294638079),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289644287),
      surfaceTint: Color(4289644287),
      onPrimary: Color(4279381856),
      primaryContainer: Color(4281091704),
      onPrimaryContainer: Color(4292403967),
      secondary: Color(4290758364),
      onSecondary: Color(4280889409),
      secondaryContainer: Color(4282337113),
      onSecondaryContainer: Color(4292600569),
      tertiary: Color(4292852702),
      onTertiary: Color(4282394691),
      tertiaryContainer: Color(4283973210),
      onTertiaryContainer: Color(4294760443),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374616),
      onSurface: Color(4293059305),
      onSurfaceVariant: Color(4291151568),
      outline: Color(4287533209),
      outlineVariant: Color(4282664783),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4282736273),
      primaryFixed: Color(4292403967),
      onPrimaryFixed: Color(4278196803),
      primaryFixedDim: Color(4289644287),
      onPrimaryFixedVariant: Color(4281091704),
      secondaryFixed: Color(4292600569),
      onSecondaryFixed: Color(4279507756),
      secondaryFixedDim: Color(4290758364),
      onSecondaryFixedVariant: Color(4282337113),
      tertiaryFixed: Color(4294760443),
      onTertiaryFixed: Color(4280947501),
      tertiaryFixedDim: Color(4292852702),
      onTertiaryFixedVariant: Color(4283973210),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290104063),
      surfaceTint: Color(4289644287),
      onPrimary: Color(4278195512),
      primaryContainer: Color(4286091463),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291021537),
      onSecondary: Color(4279178790),
      secondaryContainer: Color(4287205541),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293116131),
      onTertiary: Color(4280552743),
      tertiaryContainer: Color(4289169063),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294769407),
      onSurfaceVariant: Color(4291414740),
      outline: Color(4288783020),
      outlineVariant: Color(4286677900),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4281223033),
      primaryFixed: Color(4292403967),
      onPrimaryFixed: Color(4278194222),
      primaryFixedDim: Color(4289644287),
      onPrimaryFixedVariant: Color(4279907686),
      secondaryFixed: Color(4292600569),
      onSecondaryFixed: Color(4278784289),
      secondaryFixedDim: Color(4290758364),
      onSecondaryFixedVariant: Color(4281284168),
      tertiaryFixed: Color(4294760443),
      onTertiaryFixed: Color(4280158242),
      tertiaryFixedDim: Color(4292852702),
      onTertiaryFixedVariant: Color(4282854729),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294769407),
      surfaceTint: Color(4289644287),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290104063),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294769407),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291021537),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293116131),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294769407),
      outline: Color(4291414740),
      outlineVariant: Color(4291414740),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4278790233),
      primaryFixed: Color(4292863743),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290104063),
      onPrimaryFixedVariant: Color(4278195512),
      secondaryFixed: Color(4292863741),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291021537),
      onSecondaryFixedVariant: Color(4279178790),
      tertiaryFixed: Color(4294958334),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293116131),
      onTertiaryFixedVariant: Color(4280552743),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279900960),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
