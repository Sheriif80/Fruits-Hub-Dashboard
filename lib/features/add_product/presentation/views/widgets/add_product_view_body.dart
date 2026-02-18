import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: const Column(
            children: [
              CustomTextFormField(
                hintText: 'Product ID',
                keyboardType: TextInputType.number,
              ),
              Gap(20),
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              Gap(12),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              Gap(12),
              CustomTextFormField(
                maxLines: 5,
                hintText: 'Product description',
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
