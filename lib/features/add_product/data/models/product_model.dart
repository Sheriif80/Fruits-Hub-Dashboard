import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String code;
  String? productID;
  final String name;
  final String description;
  final File image;
  final num price;
  final bool isFeatured;
  final String? imageURL;
  final int expiryDateMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  num avgRating;
  int numberOfRatings;
  int sellingCount;

  ProductModel({
    required this.code,
    required this.productID,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isFeatured,
    required this.imageURL,
    required this.expiryDateMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    this.avgRating = 0,
    this.numberOfRatings = 0,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      code: addProductInputEntity.code,
      productID: addProductInputEntity.productID,
      name: addProductInputEntity.name,
      description: addProductInputEntity.description,
      image: addProductInputEntity.image,
      price: addProductInputEntity.price,
      isFeatured: addProductInputEntity.isFeatured,
      imageURL: addProductInputEntity.imageURL,
      expiryDateMonths: addProductInputEntity.expiryDateMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
    );
  }
  toMap() => {
    "code": code,
    "productID": productID,
    "name": name,
    "description": description,
    "imageURL": imageURL,
    "price": price,
    "isFeatured": isFeatured,
    "expiryDateMonths": expiryDateMonths,
    "isOrganic": isOrganic,
    "numberOfCalories": numberOfCalories,
    "unitAmount": unitAmount,
    "avgRating": avgRating,
    "numberOfRatings": numberOfRatings,
    "sellingCount": sellingCount,
  };
}
