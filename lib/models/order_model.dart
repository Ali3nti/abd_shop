import 'package:abd_shop/models/address_model.dart';
import 'package:abd_shop/models/product_model.dart';

class Order {
  int id = 0;
  int userId = 0;
  List<Product> products = [];
  double totalPrice = 100.0;
  String orderStatus = '';
  DateTime orderDate = DateTime.now();
  List<Address> shippingAddresses = [];
  String paymentMethod = '';
  String trackingNumber = '0000';
  String comments = '';
  double discount = 10.0;
  DateTime? deliveryDate;
  String deliveryUserName = '';
  String deliveryUserPhone = '0000-000-0000';
  String status = '';
  List<Address> deliveryAddresses = [];
  String storeName = '';
  String trackingId = 'ABD-0000';
  double itemPrice = 0.0;
  double deliveryCost = 0.0;
  double preparationCost = 0.0;

  Order();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    totalPrice = (json['total_price'] as num?)?.toDouble() ?? 100.0;
    orderStatus = json['order_status'] ?? '';
    orderDate = DateTime.parse(json['order_date'] ?? DateTime.now().toIso8601String());
    shippingAddresses = (json['shipping_addresses'] as List<dynamic>?)
        ?.map((addressJson) => Address.fromJson(addressJson))
        .toList() ?? []; // تبدیل به لیست Address
    paymentMethod = json['payment_method'] ?? '';
    trackingNumber = json['tracking_number'] ?? '0000';
    comments = json['comments'] ?? '';
    discount = (json['discount'] as num?)?.toDouble() ?? 10.0;
    deliveryDate = json['delivery_date'] != null ? DateTime.parse(json['delivery_date']) : null;
    products = (json['products'] as List<dynamic>?)
        ?.map((productJson) => Product.fromJson(productJson))
        .toList() ?? [];
    deliveryUserName = json['delivery_user_name'] ?? '';
    deliveryUserPhone = json['delivery_user_phone'] ?? '0000-000-0000';
    status = json['status'] ?? '';
    deliveryAddresses = (json['delivery_addresses'] as List<dynamic>?)
        ?.map((addressJson) => Address.fromJson(addressJson))
        .toList() ?? []; // تبدیل به لیست Address
    storeName = json['store_name'] ?? '';
    trackingId = json['tracking_id'] ?? 'ABD-0000';
    itemPrice = (json['item_price'] as num?)?.toDouble() ?? 0.0;
    deliveryCost = (json['delivery_cost'] as num?)?.toDouble() ?? 0.0;
    preparationCost = (json['preparation_cost'] as num?)?.toDouble() ?? 0.0;
  }
}
