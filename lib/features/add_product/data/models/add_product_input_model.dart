import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel extends AddProductInputEntity {
  AddProductInputModel({
    required super.code,
    required super.name,
    required super.description,
    required super.image,
    required super.price,
    required super.isFeatured,
    required super.imageURL,
    required super.expiryDateMonths,
    required super.isOrganic,
    required super.numberOfCalories,
    required super.unitAmount,
    required super.avgRating,
    required super.numberOfRatings,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      code: addProductInputEntity.code,
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
      avgRating: addProductInputEntity.avgRating,
      numberOfRatings: addProductInputEntity.numberOfRatings,
    );
  }
  toMap() => {
    "code": code,
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
  };
}
