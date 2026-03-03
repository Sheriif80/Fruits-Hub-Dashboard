import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helpers/get_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          FilterSection(),
          Expanded(child: OrdersListView(orders: DummyOrders.orders)),
        ],
      ),
    );
  }
}
