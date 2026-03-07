import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubits/update_order_cubit/update_order_cubit.dart';
import 'package:gap/gap.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: orderEntity.status == "pending",
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderId: orderEntity.orderID,
                status: OrderStatusEnum.accepted,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == "pending",
          child: const Gap(10),
        ),
        Visibility(
          visible: orderEntity.status == "pending",
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderId: orderEntity.orderID,
                status: OrderStatusEnum.rejected,
              );
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == "accepted",
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
