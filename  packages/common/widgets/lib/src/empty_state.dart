import 'package:flutter/material.dart';

/// 空状态组件
class EmptyState extends StatelessWidget {
  /// 空状态组件
  const EmptyState({super.key, this.slug = 'empty', this.text = '出错了', this.onPress});

  /// 图标标识
  final String slug;

  /// 文本
  final String text;

  /// 点击事件
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        height: 350,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/icons/icon_$slug.png', width: 150, height: 150, package: 'widgets'),
            Container(
              padding: const EdgeInsets.all(13),
              child: Text(text,
                  textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFD3D3D3), fontSize: 16)),
            ),
          ],
        )),
      ),
      onTap: () => onPress?.call(),
    );
  }
}
