
import 'package:flutter/material.dart';

import 'color_config.dart';

extension ColorSchemeExt on ColorScheme{
  Color get success => customColorScheme.success;
  Color get warning => customColorScheme.warning;
  Color get white => customColorScheme.white;
}