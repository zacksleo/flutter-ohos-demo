import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() => _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        const SizedBox(height: 100),
        GestureDetector(
            child: const Text('set key'),
            onTap: () => {
                  SharedPreferences.getInstance().then((prefs) {
                    // random key
                    String key = '${Random().nextInt(100)}';
                    prefs.setString('key',  key).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('set key success: $key')));
                    });
                  })
                }),
        const SizedBox(height: 20),
        GestureDetector(
          child: const Text('get key'),
          onTap: () => {
            SharedPreferences.getInstance().then((prefs) {
              final String? value = prefs.getString('key');
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value ?? '')));
            })
          },
        ),
      ],
    ))));
  }
}
