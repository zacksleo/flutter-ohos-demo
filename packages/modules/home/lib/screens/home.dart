import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:domains/enums.dart';
import 'package:services/services.dart';

class HomeIndexScreen extends StatefulWidget {
  const HomeIndexScreen({super.key});

  @override
  State<HomeIndexScreen> createState() => _HomeIndexScreenState();
}

class _HomeIndexScreenState extends State<HomeIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const SizedBox(height: 200),
        GestureDetector(
          child: const Text('插件列表'),
          onTap: () => context.push(AppRoutes.plugins.value),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('原生页面'),
          onTap: () => PlatformCall.redirectNative('pages/Amap'),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('混合页面'),
          onTap: () => context.push(AppRoutes.amapPlugin.value),
        ),
      ],
    ))));
  }
}
