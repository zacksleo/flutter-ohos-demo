import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterInappwebviewScreen extends StatelessWidget {
  const FlutterInappwebviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: InAppWebView(initialUrlRequest: URLRequest(url: WebUri("https://www.nutpi.net/")))));
  }
}
