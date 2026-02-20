import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/app_snackbars.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/cubits/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductLoading) {}
        if (state is AddProductError) {
          AppSnackbars.showError(context, message: state.message);
        }
        if (state is AddProductSuccess) {
          AppSnackbars.showSuccess(context, message: state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
