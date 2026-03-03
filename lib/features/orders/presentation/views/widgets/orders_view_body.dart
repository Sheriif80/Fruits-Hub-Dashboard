import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const FilterSection(),
          Expanded(child: OrdersListView(orders: orders)),
        ],
      ),
    );
  }
}
