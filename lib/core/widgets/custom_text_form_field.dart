import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.onSaved,
    this.obsecureText = false,
    this.maxLines = 1,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obsecureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obsecureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(hintText),
        hintStyle: Appstyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() => OutlineInputBorder(
    borderSide: const BorderSide(width: 0.4),
    borderRadius: BorderRadius.circular(30),
  );
}
