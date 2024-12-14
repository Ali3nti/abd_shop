import 'package:abd_shop/models/product_model.dart';

class Order {
  int id;
  int userId;
  List<Product> products;
  double totalPrice;
  String orderStatus;
  DateTime orderDate;
  String shippingAddress;
  String paymentMethod;
  String trackingNumber;
  String comments;
  double discount;
  DateTime? deliveryDate;
  final String deliveryPersonName;
  final String deliveryPersonUsername;
  final String deliveryPersonPhone;
  final String status;
  final String deliveryAddress;
  final String storeName;
  final String trackingId;
  final double itemPrice;
  final double deliveryCost;
  final double preparationCost;

  Order({
    this.id = 0,
    this.userId = 0,
    List<Product>? products,
    this.totalPrice = 0.0,
    this.orderStatus = '',
    DateTime? orderDate,
    this.shippingAddress = '',
    this.paymentMethod = '',
    this.trackingNumber = '',
    this.comments = '',
    this.discount = 0.0,
    this.deliveryDate,
    required this.deliveryPersonName,
    required this.deliveryPersonUsername,
    required this.deliveryPersonPhone,
    required this.status,
    required this.deliveryAddress,
    required this.storeName,
    required this.trackingId,
    required this.itemPrice,
    required this.deliveryCost,
    required this.preparationCost,
  })  : products = products ?? [],
        orderDate = orderDate ?? DateTime.now();

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        userId = json['user_id'] ?? 0,
        totalPrice = (json['total_price'] as num?)?.toDouble() ?? 0.0,
        orderStatus = json['order_status'] ?? '',
        orderDate = DateTime.parse(json['order_date'] ??
            DateTime.now().toIso8601String(),),
        shippingAddress = json['shipping_address'] ?? '',
        paymentMethod = json['payment_method'] ?? '',
        trackingNumber = json['tracking_number'] ?? '',
        comments = json['comments'] ?? '',
        discount = (json['discount'] as num?)?.toDouble() ?? 0.0,
        deliveryDate = json['delivery_date'] != null
            ? DateTime.parse(json['delivery_date'])
            : null,
        products = (json['products'] as List<dynamic>?)
            ?.map((productJson) => Product.fromJson(productJson))
            .toList() ??
            [],
        deliveryPersonName = json['delivery_person_name'] ?? '',
        deliveryPersonUsername = json['delivery_person_username'] ?? '',
        deliveryPersonPhone = json['delivery_person_phone'] ?? '',
        status = json['status'] ?? '',
        deliveryAddress = json['delivery_address'] ?? '',
        storeName = json['store_name'] ?? '',
        trackingId = json['tracking_id'] ?? '',
        itemPrice = (json['item_price'] as num?)?.toDouble() ?? 0.0,
        deliveryCost = (json['delivery_cost'] as num?)?.toDouble() ?? 0.0,
        preparationCost = (json['preparation_cost'] as num?)?.toDouble() ?? 0.0;
}
