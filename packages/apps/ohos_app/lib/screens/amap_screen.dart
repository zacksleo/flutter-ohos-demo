import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ohos_app/screens/amap_widget.dart';

class AmapScreen extends StatefulWidget {
  const AmapScreen({super.key});

  @override
  State<AmapScreen> createState() => _AmapScreenState();
}

class _AmapScreenState extends State<AmapScreen> {
  String receivedData = '';
  AmapWidgetController? _controller;

  void _onViewCreated(AmapWidgetController controller) {
    _controller = controller;
    _controller?.customDataStream.listen((data) {
      //接收到来自OHOS端的数据
      setState(() {
        receivedData = '来自ohos的数据：$data';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   color: Colors.blue,
        //   child:
        // SizedBox(
        //   height: 120,
        //   width: 200,
        //   child: CustomOhosView(_onCustomOhosViewCreated),
        // )
        // ),
        const SizedBox(
          height: 200,
        ),
        SizedBox(
          height: 200,
          width: 400,
          child: AmapWidget(_onViewCreated),
        ),
        TextButton(
          onPressed: () {
            final randomNum = Random().nextInt(10);
            debugPrint('发送数据给ohos：$randomNum');
            _controller?.sendMessageToOhosView('flutter - $randomNum ');
          },
          child: const Text('发送数据给ohos'),
        ),
      ],
    );
  }
}
