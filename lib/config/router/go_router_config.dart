import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screen/home/home_screen.dart';
import '../../screen/setting/setting_screen.dart';

abstract final class RouterPath {
  static const String homeScreen = '/';
  static const String detailScreen = '/detailScreen';
  static const String settingScreen = '/settingScreen';
}

final class GoRouterConfig {
  GoRouterConfig();

  late final GoRouter goRouter = GoRouter(
    initialLocation: RouterPath.homeScreen,
    debugLogDiagnostics: true,
    routes: _routes,
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
  );

  late final List<RouteBase> _routes = [
    GoRoute(
      name: RouterPath.homeScreen,
      path: RouterPath.homeScreen,
      builder: (ctx, state) => const HomeScreen(),
    ),
    GoRoute(
      name: RouterPath.settingScreen,
      path: RouterPath.settingScreen,
      builder: (ctx, state) => const SettingScreen(),
    ),
  ];
}
