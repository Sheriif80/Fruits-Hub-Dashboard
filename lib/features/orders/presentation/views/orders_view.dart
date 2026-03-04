import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubits/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetOrdersCubit(getIt<OrdersRepo>())..getOrders(),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt<OrdersRepo>()),
        ),
      ],

      child: Scaffold(
        appBar: buildAppBar(title: 'Orders'),
        body: const OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}
