import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';

class IsFeautredProduct extends StatefulWidget {
  const IsFeautredProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;
  @override
  State<IsFeautredProduct> createState() => _IsFeautredProductState();
}

class _IsFeautredProductState extends State<IsFeautredProduct> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: AppColors.lightpPrimaryColor,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Featured Product ?",
                style: Appstyles.semiBold16.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
