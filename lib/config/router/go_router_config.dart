import 'package:demo_application/screen/article/article_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screen/home/home_screen.dart';
import '../../screen/setting/setting_screen.dart';

abstract final class RouterPath {
  static const String homeScreen = '/';
  static const String detailScreen = '/detailScreen';
  static const String settingScreen = '/settingScreen';
  static const String articleScreen = '/articleScreen/:temp/:unit';

  static String articleScreenPath(double temperature, String unit) =>
      '/articleScreen/:$temperature/:$unit';
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
    GoRoute(
      path: RouterPath.articleScreen,
      builder: (ctx, state) {
        double temperature = _parseDouble(state.pathParameters['temp']);
        String unit = _extractPath(state.pathParameters['unit']);
        return ArticleScreen(temperature: temperature, unit: unit);
      },
    ),
  ];

  String _extractPath(String? path) {
    return path!.replaceAll(':', '');
  }

  double _parseDouble(String? path) {
    return double.parse(_extractPath(path));
  }
}
