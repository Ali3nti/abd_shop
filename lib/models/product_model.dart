class Product {
  int id = 0;
  int cartCount = 0;
  String name = '';
  int categoryId = 0;
  int price = 0;
  String image = 'N/A';
  String description = '';
  int stockQuantity = 0;
  String unit = '';
  String brand = '';
  int isActive = 0;
  double weight = 0;
  String dimensions = '';
  String color = '';
  double rating = 0;
  String comments = '';
  int reviewCount = 0;
  int discount = 0;
  DateTime? offerStart;
  DateTime? offerEnd;
  String warranty = '';
  String tags = '';
  String providerVendors = '';
  bool _isInStock = false; // وضعیت موجودی
  bool _isShipped = false; // وضعیت ارسال

  // وضعیت‌های جدید
  bool get isOutOfStock => !_isInStock; // اگر موجودی نداشته باشد
  bool get isShipping => _isShipped; // اگر در حال ارسال باشد

  // Getter ها برای فیلدهای وضعیت
  bool get isInStock => _isInStock;
  bool get isShipped => _isShipped;

  // Setterها
  set isInStock(bool value) {
    _isInStock = value;
  }

  set isShipped(bool value) {
    _isShipped = value;
  }

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    categoryId = json['category_id'] ?? 0;
    price = json['price'] ?? 0;
    image = json['image'] ?? 'N/A';
    description = json['description'] ?? '';
    stockQuantity = json['stock_quantity'] ?? 0;
    unit = json['unit'] ?? '';
    brand = json['brand'] ?? '';
    isActive = json['is_active'] ?? 0;
    weight = (json['weight'] as num?)?.toDouble() ?? 0;
    dimensions = json['dimensions'] ?? '';
    color = json['color'] ?? '';
    rating = (json['rating'] as num?)?.toDouble() ?? 0;
    reviewCount = json['review_count'] ?? 0;
    discount = (json['discount'] as num?)?.toInt() ?? 0;
    _isInStock = json['is_in_stock'] ?? false;
    _isShipped = json['is_shipped'] ?? false;
    warranty = json['warranty'] ?? '';
    tags = json['tags'] ?? '';
    providerVendors = json['provider_vendors'] ?? '';
  }
}
