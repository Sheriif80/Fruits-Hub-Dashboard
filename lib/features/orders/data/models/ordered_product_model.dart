import 'package:fruits_hub_dashboard/features/orders/domain/entities/ordered_product_entity.dart';

class OrderedProductModel {
  final String code;
  final String name;
  final int quantity;
  final num price;

  OrderedProductModel({
    required this.code,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderedProductModel.fromJson(Map<String, dynamic> json) =>
      OrderedProductModel(
        code: json['code'],
        name: json['name'],
        quantity: json['quantity'],
        price: json['price'],
      );

  OrderedProductEntity toEntity() => OrderedProductEntity(
    code: code,
    name: name,
    quantity: quantity,
    price: price,
  );

  toJson() => {
    'code': code,
    'name': name,
    'quantity': quantity,
    'price': price,
  };
}
