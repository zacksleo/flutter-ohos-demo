import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:domains/enums.dart';
import 'package:plugins/src/screens/cached_network_image.dart';
import 'package:plugins/src/screens/flutter_inappwebview.dart';
import 'package:plugins/src/screens/video_player.dart';

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
            child: const Text('flutter_inappwebview'),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FlutterInappwebviewScreen()),
                )),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('video_player'),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VideoPlayerScreen()),
          ),
        ),
      ],
    ))));
  }
}
