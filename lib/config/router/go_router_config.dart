import 'package:demo_application/model/freez/freez.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screen/detail/detail_screen.dart';
import '../../screen/home/home_screen.dart';

abstract final class RouterPath {
  static const String homeScreen = '/';
  static const String detailScreen = '/detailScreen';
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
      name: RouterPath.detailScreen,
      path: RouterPath.detailScreen,
      builder: (ctx, state) => DetailScreen(
        person: state.extra as Person,
      ),
    ),
  ];
}
