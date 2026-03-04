import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == "Pending",
          child: ElevatedButton(onPressed: () {}, child: const Text('Accept')),
        ),
        Visibility(
          visible: orderEntity.status == "Pending",
          child: ElevatedButton(onPressed: () {}, child: const Text('Reject')),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted.toString(),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
