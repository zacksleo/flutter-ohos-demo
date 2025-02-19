import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:domains/enums.dart';
import 'package:plugins/src/screens/cached_network_image.dart';

class PluginIndexScreen extends StatefulWidget {
  const PluginIndexScreen({super.key});

  @override
  State<PluginIndexScreen> createState() => _PluginIndexScreenState();
}

class _PluginIndexScreenState extends State<PluginIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const SizedBox(height: 100),
        GestureDetector(
            child: const Text('cached_network_image'),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CachedNetworkImageScreen()),
                )),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('播放器-VideoPlayer'),
          onTap: () => context.push(AppRoutes.videoPlayer.value),
        ),
      ],
    ))));
  }
}
