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

  toJson() => {
    'code': code,
    'name': name,
    'quantity': quantity,
    'price': price,
  };
}
