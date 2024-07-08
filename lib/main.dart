import 'dart:async';

import 'package:flutter/material.dart';

import 'application/app.dart';
import 'application/initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([initializer()]);
  runApp(const MyApp());
}
