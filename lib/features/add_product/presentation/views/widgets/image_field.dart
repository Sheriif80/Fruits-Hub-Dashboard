import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 0.4),
      ),
      height: 200,
      width: double.infinity,
      child: const Center(child: Icon(Icons.camera_alt, size: 50)),
    );
  }
}
