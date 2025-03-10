import 'package:flutter/services.dart';

const MethodChannel _methodChannel = MethodChannel('shaohushuo.com/app');

class PlatformCall {
  MethodChannel withMethodChannel() {
    return _methodChannel;
  }

  static Future<dynamic> redirectNative(String url) {
    return _methodChannel.invokeMethod("redirectNative", {
      "url": url,
    });
  }
}
