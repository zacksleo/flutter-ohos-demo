/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnViewCreated = Function(AmapWidgetController);

///自定义OhosView
class AmapWidget extends StatefulWidget {
  final OnViewCreated onViewCreated;

  const AmapWidget(this.onViewCreated, {super.key});

  @override
  State<AmapWidget> createState() => _AmapWidgetState();
}

class _AmapWidgetState extends State<AmapWidget> {
  late MethodChannel _channel;

  @override
  Widget build(BuildContext context) {
    return _getPlatformFaceView();
  }

  Widget _getPlatformFaceView() {
    return OhosView(
      viewType: 'com.shaohushuo.app/customView',
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParams: const <String, dynamic>{'initParams': 'hello world'},
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  void _onPlatformViewCreated(int id) {
    _channel = MethodChannel('com.shaohushuo.app/customView/$id');
    final controller = AmapWidgetController._(
      _channel,
    );
    widget.onViewCreated(controller);
  }
}

class AmapWidgetController {
  final MethodChannel _channel;
  final StreamController<String> _controller = StreamController<String>();

  AmapWidgetController._(
    this._channel,
  ) {
    _channel.setMethodCallHandler(
      (call) async {
        switch (call.method) {
          case 'getMessageFromOhosView':
            // 从native端获取数据
            final result = call.arguments as String;
            _controller.sink.add(result);
            debugPrint('getMessageFromOhosView: $result');
            break;
        }
      },
    );
  }

  Stream<String> get customDataStream => _controller.stream;

  // 发送数据给native
  Future<void> sendMessageToOhosView(String message) async {
    await _channel.invokeMethod(
      'getMessageFromFlutterView',
      message,
    );
  }
}
