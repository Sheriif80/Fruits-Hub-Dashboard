import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helpers/pick_image_from_storage.dart';
import 'package:fruits_hub_dashboard/core/utils/app_snackbars.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool _isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() => _isLoading = true);
          try {
            final XFile? image = await pickImageFromStorage();
            if (image == null) {
              setState(() => _isLoading = false);
              return;
            }
            fileImage = File(image.path);
            AppSnackbars.showSuccess(context, message: " Image was picked");
          } catch (e) {
            AppSnackbars.showError(context, message: "Image was not picked");
          }
          setState(() => _isLoading = false);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.4),
              ),
              height: 200,
              width: double.infinity,
              child: fileImage != null
                  ? ClipRect(child: Image.file(fileImage!, fit: BoxFit.fill))
                  : const Center(child: Icon(Icons.camera_alt, size: 50)),
            ),
            Visibility(
              visible: fileImage != null,
              child: Positioned(
                top: 5,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    setState(() => fileImage = null);
                    AppSnackbars.showSuccess(context, message: "Image removed");
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
