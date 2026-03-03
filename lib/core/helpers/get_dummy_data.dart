import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/ordered_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';

class DummyOrders {
  static List<OrderModel> orders = [
    OrderModel(
      userID: "U1001",
      totalPrice: 350,
      paymentMethod: "Cash On Delivery",
      shippingAddress: ShippingAddressModel(
        fullName: "Ahmed Mohamed",
        email: "ahmed@gmail.com",
        phone: "01012345678",
        city: "Cairo",
        address: "Nasr City - Abbas El Akkad",
        appartment: "12B",
      ),
      orderedProducts: [
        OrderedProductModel(
          code: "FR01",
          name: "Banana",
          quantity: 3,
          price: 20,
        ),
        OrderedProductModel(
          code: "FR02",
          name: "Apple",
          quantity: 5,
          price: 30,
        ),
        OrderedProductModel(
          code: "FR03",
          name: "Orange",
          quantity: 2,
          price: 25,
        ),
      ],
    ),

    OrderModel(
      userID: "U1002",
      totalPrice: 180,
      paymentMethod: "Credit Card",
      shippingAddress: ShippingAddressModel(
        fullName: "Sara Ali",
        email: "sara@gmail.com",
        phone: "01198765432",
        city: "Alexandria",
        address: "Smouha",
        appartment: "5A",
      ),
      orderedProducts: [
        OrderedProductModel(
          code: "FR04",
          name: "Strawberry",
          quantity: 2,
          price: 40,
        ),
        OrderedProductModel(
          code: "FR05",
          name: "Mango",
          quantity: 3,
          price: 35,
        ),
      ],
    ),

    OrderModel(
      userID: "U1003",
      totalPrice: 520,
      paymentMethod: "Vodafone Cash",
      shippingAddress: ShippingAddressModel(
        fullName: "Omar Hassan",
        email: "omar@gmail.com",
        phone: "01234567890",
        city: "Giza",
        address: "Dokki",
        appartment: "10C",
      ),
      orderedProducts: [
        OrderedProductModel(
          code: "FR06",
          name: "Pineapple",
          quantity: 1,
          price: 90,
        ),
        OrderedProductModel(code: "FR07", name: "Kiwi", quantity: 6, price: 25),
        OrderedProductModel(
          code: "FR08",
          name: "Watermelon",
          quantity: 1,
          price: 120,
        ),
        OrderedProductModel(
          code: "FR09",
          name: "Grapes",
          quantity: 4,
          price: 45,
        ),
      ],
    ),
  ];
}
