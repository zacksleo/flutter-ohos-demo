import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _selectedImage;

  pickImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          const SizedBox(height: 100),
          TextButton(onPressed: () {
            pickImage();
          }, child: const Text('Pick Image')),
          const SizedBox(height: 100),
          _selectedImage != null
      ? Image.file(_selectedImage!, fit: BoxFit.cover, width: 200,)
      : const Text("未选择图片")
        ],
      ))),
    );
  }
}
