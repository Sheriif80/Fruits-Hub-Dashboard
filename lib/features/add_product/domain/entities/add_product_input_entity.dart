import 'dart:io';

class AddProductInputEntity {
  final String code;
  final String name;
  final String description;
  final String? imageURL;
  final File image;
  final num price;
  final bool isFeatured;

  AddProductInputEntity({
    required this.code,
    required this.name,
    required this.description,
    this.imageURL,
    required this.image,
    required this.price,
    required this.isFeatured,
  });
}
