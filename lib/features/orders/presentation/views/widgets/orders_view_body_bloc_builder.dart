import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helpers/get_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBlocBuilder extends StatelessWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoading) {
          return Skeletonizer(
            child: OrdersViewBody(orders: DummyOrders.orders),
          );
        } else if (state is GetOrdersSuccess) {
          log(state.orders.length.toString());
          return OrdersViewBody(orders: state.orders);
        } else if (state is GetOrdersError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
