import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MeIndexScreen extends StatefulWidget {
  const MeIndexScreen({super.key});

  @override
  State<MeIndexScreen> createState() => _MeIndexScreenState();
}

class _MeIndexScreenState extends State<MeIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const SizedBox(height: 200),
        const Text('我的', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        const SizedBox(height: 80),
        GestureDetector(
          child: const Text('跳转到帮助中心'),
          onTap: () => context.push('/support/index'),
        ),
      ],
    )));
  }
}
