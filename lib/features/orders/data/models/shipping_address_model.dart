import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? appartment;

  ShippingAddressModel({
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.appartment,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      appartment: json['appartment'],
    );
  }

  toEntity() {
    return ShippingAddressEntity(
      fullName: fullName,
      email: email,
      phone: phone,
      address: address,
      city: city,
      appartment: appartment,
    );
  }

  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "appartment": appartment,
    };
  }
}
