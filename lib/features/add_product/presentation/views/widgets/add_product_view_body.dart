import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_snackbars.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_product.dart';
import 'package:gap/gap.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String? productCode, productName, productDescription;
  late num? productPrice;
  File? fileImage;
  bool isFeatured = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  productName = value;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  productDescription = value;
                },
                maxLines: 5,
                hintText: 'Product description',
                keyboardType: TextInputType.text,
              ),
              const Gap(12),
              ImageField(
                onImagePicked: (image) {
                  fileImage = image;
                },
              ),
              const Gap(12),
              IsFeautredProduct(onChecked: (value) {}),
              const Gap(12),
              CustomButton(
                text: "Add Product",
                onPressed: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                    AppSnackbars.showError(
                      context,
                      message: "Please Select an Image",
                    );
                  }
                },
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}
