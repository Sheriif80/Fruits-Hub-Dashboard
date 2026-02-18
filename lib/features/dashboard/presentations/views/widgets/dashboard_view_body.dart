import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/routing/app_routes.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          CustomButton(
            text: "Add Data",
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.addProductView);
            },
          ),
        ],
      ),
    );
  }
}
