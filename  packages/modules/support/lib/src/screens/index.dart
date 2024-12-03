import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportIndexScreen extends StatefulWidget {
  const SupportIndexScreen({super.key});

  @override
  State<SupportIndexScreen> createState() => _SupportIndexScreenState();
}

class _SupportIndexScreenState extends State<SupportIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Text('帮助中心', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 80),
            GestureDetector(
              child: const Text('返回'),
              onTap: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
