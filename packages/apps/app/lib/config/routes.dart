import 'package:home/screens/tab.dart';
import 'package:support/routes.dart' as support;
import 'package:domains/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


Map<AppRoutes, Widget Function(BuildContext context, GoRouterState state)>
    routes = {
  AppRoutes.home: (context, state) => const MainTabScreen(),
  ...support.routes,
};
