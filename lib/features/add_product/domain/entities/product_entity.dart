import 'dart:io';

class ProductEntity {
  final String code;
  final String name;
  final String description;
  String? imageURL;
  final File image;
  final num price;
  final bool isFeatured;
  final int expiryDateMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;

  ProductEntity({
    required this.code,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isFeatured,
    this.imageURL,
    required this.expiryDateMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
  });
}
