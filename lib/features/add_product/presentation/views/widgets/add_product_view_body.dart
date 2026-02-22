import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/app_snackbars.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/cubits/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_product.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_product.dart';
import 'package:gap/gap.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String? productCode, productName, productDescription;
  late num productPrice, avgRating;
  File? fileImage;
  bool isFeatured = false;
  bool isOrganic = false;
  late int expiryDateMonths, numberOfCalories, unitAmount, numberOfRatings;

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
                keyboardType: TextInputType.text,
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
              CustomTextFormField(
                onSaved: (value) {
                  expiryDateMonths = int.parse(value!);
                },
                hintText: ' Expiry Date in months',
                keyboardType: TextInputType.number,
              ),

              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
                hintText: 'Number of Calories',
                keyboardType: TextInputType.number,
              ),

              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
                hintText: 'Unit Amount',
                keyboardType: TextInputType.number,
              ),

              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  avgRating = num.parse(value!);
                },
                hintText: ' Average Rating',
                keyboardType: TextInputType.number,
              ),

              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfRatings = int.parse(value!);
                },
                hintText: ' Number of Ratings',
                keyboardType: TextInputType.number,
              ),

              const Gap(12),
              CustomTextFormField(
                onSaved: (value) {
                  productDescription = value;
                },
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
              IsFeautredProduct(
                onChecked: (value) {
                  isFeatured = value;
                },
              ),
              const Gap(12),
              IsOrganicProduct(
                onChecked: (value) {
                  isOrganic = value;
                },
              ),
              const Gap(12),
              CustomButton(
                text: "Add Product",
                onPressed: () {
                  if (fileImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final AddProductInputEntity productInputEntity =
                          AddProductInputEntity(
                            code: productCode!,
                            name: productName!,
                            description: productDescription!,
                            price: productPrice,
                            image: fileImage!,
                            isFeatured: isFeatured,
                            isOrganic: isOrganic,
                            expiryDateMonths: expiryDateMonths,
                            numberOfCalories: numberOfCalories,
                            unitAmount: unitAmount,
                            avgRating: avgRating,
                            numberOfRatings: numberOfRatings,
                          );
                      BlocProvider.of<AddProductCubit>(
                        context,
                      ).addProduct(productInputEntity);
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
