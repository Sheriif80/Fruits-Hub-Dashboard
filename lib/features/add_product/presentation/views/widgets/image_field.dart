import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() => _isLoading = true);
          try {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
              source: ImageSource.gallery,
            );
          } on Exception catch (e) {}
          if (!mounted) return;
          setState(() => _isLoading = false);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 0.4),
          ),
          height: 200,
          width: double.infinity,
          child: const Center(child: Icon(Icons.camera_alt, size: 50)),
        ),
      ),
    );
  }
}
