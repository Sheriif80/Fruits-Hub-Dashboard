import 'dart:io';

class AddProductInputEntity {
  final String code;
  final String name;
  final String description;
  String? imageURL;
  final File image;
  final num price;
  final bool isFeatured;

  AddProductInputEntity({
    required this.code,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isFeatured,
    this.imageURL,
  });
}
