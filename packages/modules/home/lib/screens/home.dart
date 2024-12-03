import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomeIndexScreen extends StatefulWidget {
  const HomeIndexScreen({super.key});

  @override
  State<HomeIndexScreen> createState() => _HomeIndexScreenState();
}

class _HomeIndexScreenState extends State<HomeIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri("https://www.nutpi.net/")))));
  }
}
