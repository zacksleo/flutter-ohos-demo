import 'package:home/screens/tab.dart';
import 'package:community/routes.dart' as community;
import 'package:player/routes.dart' as player;
import 'package:plugins/routes.dart' as plugins;
import 'package:support/routes.dart' as support;
import 'package:domains/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


Map<AppRoutes, Widget Function(BuildContext context, GoRouterState state)>
    routes = {
  AppRoutes.home: (context, state) => const MainTabScreen(),
  ...community.routes,
  ...plugins.routes,
  ...player.routes,
  ...support.routes,
};
