import 'package:flutter/material.dart';

class MeIndexScreen extends StatefulWidget {
  const MeIndexScreen({super.key});

  @override
  State<MeIndexScreen> createState() => _MeIndexScreenState();
}

class _MeIndexScreenState extends State<MeIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('我的'))
    );
  }
}
