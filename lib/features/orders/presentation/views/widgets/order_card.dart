import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderCard({super.key, required this.order, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.shippingAddress.fullName ?? "Unknown User",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${order.totalPrice.toStringAsFixed(2)} EGP",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              /// 🔹 Payment Method
              Text(
                "Payment: ${order.paymentMethod}",
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const Divider(height: 20),

              /// 🔹 Shipping Info
              Text(
                "📍 ${order.shippingAddress.city ?? ""} - ${order.shippingAddress.address ?? ""}",
                style: const TextStyle(fontSize: 13),
              ),

              const SizedBox(height: 10),

              /// 🔹 Ordered Products
              Column(
                children: order.orderedProducts.take(2).map((product) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${product.name} x${product.quantity}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${product.price} EGP",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              if (order.orderedProducts.length > 2)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "+${order.orderedProducts.length - 2} more items",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
