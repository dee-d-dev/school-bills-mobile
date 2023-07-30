import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:school_bills/core/routes/routes.dart';

abstract class AppRoute {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: Routes.home,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home.name,
        builder: (context, state) => const Scaffold(),
      ),
    ],
  );
}
