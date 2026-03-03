import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/ordered_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class DummyOrders {
  static List<OrderEntity> orders = [
    OrderEntity(
      userID: "U1001",
      totalPrice: 350,
      paymentMethod: "Cash On Delivery",
      shippingAddress: ShippingAddressEntity(
        fullName: "Ahmed Mohamed",
        email: "ahmed@gmail.com",
        phone: "01012345678",
        city: "Cairo",
        address: "Nasr City - Abbas El Akkad",
        appartment: "12B",
      ),
      orderedProducts: [
        OrderedProductEntity(
          code: "FR01",
          name: "Banana",
          quantity: 3,
          price: 20,
        ),
        OrderedProductEntity(
          code: "FR02",
          name: "Apple",
          quantity: 5,
          price: 30,
        ),
        OrderedProductEntity(
          code: "FR03",
          name: "Orange",
          quantity: 2,
          price: 25,
        ),
      ],
    ),

    OrderEntity(
      userID: "U1002",
      totalPrice: 180,
      paymentMethod: "Credit Card",
      shippingAddress: ShippingAddressEntity(
        fullName: "Sara Ali",
        email: "sara@gmail.com",
        phone: "01198765432",
        city: "Alexandria",
        address: "Smouha",
        appartment: "5A",
      ),
      orderedProducts: [
        OrderedProductEntity(
          code: "FR04",
          name: "Strawberry",
          quantity: 2,
          price: 40,
        ),
        OrderedProductEntity(
          code: "FR05",
          name: "Mango",
          quantity: 3,
          price: 35,
        ),
      ],
    ),

    OrderEntity(
      userID: "U1003",
      totalPrice: 520,
      paymentMethod: "Vodafone Cash",
      shippingAddress: ShippingAddressEntity(
        fullName: "Omar Hassan",
        email: "omar@gmail.com",
        phone: "01234567890",
        city: "Giza",
        address: "Dokki",
        appartment: "10C",
      ),
      orderedProducts: [
        OrderedProductEntity(
          code: "FR06",
          name: "Pineapple",
          quantity: 1,
          price: 90,
        ),
        OrderedProductEntity(
          code: "FR07",
          name: "Kiwi",
          quantity: 6,
          price: 25,
        ),
        OrderedProductEntity(
          code: "FR08",
          name: "Watermelon",
          quantity: 1,
          price: 120,
        ),
        OrderedProductEntity(
          code: "FR09",
          name: "Grapes",
          quantity: 4,
          price: 45,
        ),
      ],
    ),
  ];
}
