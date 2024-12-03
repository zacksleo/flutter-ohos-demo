import 'package:domains/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/screens/index.dart';

/// 帮助中心路由配置
Map<AppRoutes, Widget Function(BuildContext context, GoRouterState state)> routes = {
  AppRoutes.support: (context, state) => const SupportIndexScreen(),
};
