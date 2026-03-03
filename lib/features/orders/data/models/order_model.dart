import 'package:fruits_hub_dashboard/features/orders/data/models/ordered_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

class OrderModel {
  final String userID;
  final ShippingAddressModel shippingAddress;
  final double totalPrice;
  final String paymentMethod;
  final List<OrderedProductModel> orderedProducts;

  OrderModel({
    required this.userID,
    required this.shippingAddress,
    required this.totalPrice,
    required this.paymentMethod,
    required this.orderedProducts,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    userID: json["userID"],
    shippingAddress: ShippingAddressModel.fromJson(json["shippingAddress"]),
    totalPrice: json["totalPrice"].toDouble(),
    paymentMethod: json["paymentMethod"],
    orderedProducts: List<OrderedProductModel>.from(
      json["orderedProducts"].map((x) => OrderedProductModel.fromJson(x)),
    ),
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
