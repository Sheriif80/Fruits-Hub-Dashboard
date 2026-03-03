import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helpers/get_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DummyOrders.orders.length,
      itemBuilder: (context, index) {
        return OrderCard(
          order: DummyOrders.orders[index],
          onTap: () {
            print("Open order details");
          },
        );
      },
    );
    ;
  }
}
