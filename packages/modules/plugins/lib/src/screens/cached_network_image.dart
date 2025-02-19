import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageScreen extends StatefulWidget {
  const CachedNetworkImageScreen({super.key});

  @override
  State<CachedNetworkImageScreen> createState() => _CachedNetworkImageScreenState();
}

class _CachedNetworkImageScreenState extends State<CachedNetworkImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const SizedBox(height: 100),
        CachedNetworkImage(
          imageUrl: 'https://ohos.nutpi.net/privacy/applinking/logo/charstatistics_icon.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 200
        ),
        const SizedBox(height: 100),
        CachedNetworkImage(
          imageUrl: 'https://ohos.nutpi.net/privacy/applinking/logo/xiaowei_icon.png',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 200
        )
      ],
    ))));
  }
}
