import 'package:flutter/material.dart';

import '../config/router/go_router_config.dart';
import '../config/theme/theme_config.dart';
import 'initializer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouterConfig routerConfig = instance<GoRouterConfig>();
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig.goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
