import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/cubits/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductCubit(getIt.get<ImagesRepo>(), getIt.get<ProductsRepo>()),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: buildAppBar(title: 'Add Product'),
          body: const AddProductViewBody(),
        ),
      ),
    );
  }
}
