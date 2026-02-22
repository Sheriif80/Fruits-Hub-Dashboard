import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_styles.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;
  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
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
                text: "Organic Product ?",
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
