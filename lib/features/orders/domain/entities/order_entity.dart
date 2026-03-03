import 'package:fruits_hub_dashboard/features/orders/domain/entities/ordered_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String userID;
  final ShippingAddressEntity shippingAddress;
  final double totalPrice;
  final String paymentMethod;
  final String? status;
  final List<OrderedProductEntity> orderedProducts;

  OrderEntity({
    required this.userID,
    required this.shippingAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.status,
    required this.orderedProducts,
  });
}
