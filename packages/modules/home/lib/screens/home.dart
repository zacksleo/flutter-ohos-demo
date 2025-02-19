import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:domains/enums.dart';

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
      ],
    ))));
  }
}
