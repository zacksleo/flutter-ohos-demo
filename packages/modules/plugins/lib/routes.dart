import 'package:domains/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plugins/src/screens/index.dart';


/// 路由配置
Map<AppRoutes, Widget Function(BuildContext context, GoRouterState state)> routes = {
  AppRoutes.plugins: (context, state) => const PluginIndexScreen(),
};
