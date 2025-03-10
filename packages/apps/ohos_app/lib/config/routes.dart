import 'package:home/screens/tab.dart';
import 'package:ohos_app/screens/amap_screen.dart';
import 'package:plugins/routes.dart' as plugins;
import 'package:support/routes.dart' as support;
import 'package:domains/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


Map<AppRoutes, Widget Function(BuildContext context, GoRouterState state)>
    routes = {
  AppRoutes.home: (context, state) => const MainTabScreen(),
  AppRoutes.amapPlugin: (context, state) => const AmapScreen(),
  ...plugins.routes,
  ...support.routes,
};
