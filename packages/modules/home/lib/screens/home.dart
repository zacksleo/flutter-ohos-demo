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
        const SizedBox(height: 100),
        GestureDetector(
          child: const Text('社区-Webview'),
          onTap: () => context.push(AppRoutes.community.value),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('播放器-VideoPlayer'),
          onTap: () => context.push(AppRoutes.videoPlayer.value),
        ),
      ],
    ))));
  }
}
