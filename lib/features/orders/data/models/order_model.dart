import 'package:fruits_hub_dashboard/features/orders/data/models/ordered_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String userID;
  final ShippingAddressModel shippingAddress;
  final double totalPrice;
  final String paymentMethod;
  final String? status;
  final String orderID;
  final List<OrderedProductModel> orderedProducts;

  OrderModel({
    required this.userID,
    required this.shippingAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.status,
    required this.orderID,
    required this.orderedProducts,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    userID: json["userID"],
    shippingAddress: ShippingAddressModel.fromJson(json["shippingAddress"]),
    totalPrice: json["totalPrice"].toDouble(),
    paymentMethod: json["paymentMethod"],
    status: json["status"],
    orderID: json["orderID"],
    orderedProducts: List<OrderedProductModel>.from(
      json["orderedProducts"].map((x) => OrderedProductModel.fromJson(x)),
    ),
  );

  toEntity() => OrderEntity(
    userID: userID,
    shippingAddress: shippingAddress.toEntity(),
    totalPrice: totalPrice,
    paymentMethod: paymentMethod,
    status: status,
    orderID: orderID,
    orderedProducts: orderedProducts.map((e) => e.toEntity()).toList(),
  );

  toJson() => {
    "userID": userID,
    "shippingAddress": shippingAddress.toJson(),
    "status": "Pending",
    "date": DateTime.now().toString(),
    "totalPrice": totalPrice,
    "paymentMethod": paymentMethod,
    "orderedProducts": orderedProducts.map((e) => e.toJson()).toList(),
  };
}
