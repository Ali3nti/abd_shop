class Product {
  int id = 0;
  int cartCount = 0;
  String name = '';
  int categoryId = 0;
  int price = 0;
  String image = 'N/A';
  String description = '';
  int stockQuantity =
  0; //Number of products available or exist in store (stock)
  String unit = '';
  String brand = '';
  int isActive = 0;
  double weight = 0;
  String dimensions = ''; //size of the product x,y,z
  String color = '';
  double rating = 0;
  String comments = '';
  int reviewCount = 0;
  int discount = 0; //percentage for selling the product in offers
  DateTime? offerStart;
  DateTime? offerEnd;
  String warranty = '';
  String tags = '';
  String providerVendors = '';
  // Map<String, String> tags = {};
  // Map<String, String> providerVendors = {};

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
    // offerStart = json['offer_start'] != null
    //     ? DateTime.parse(json['offerStart'])
    //     : DateTime.now();
    // offerEnd = json['offer_end'] != null
    //     ? DateTime.parse(json['offerEnd'])
    //     : DateTime.now();
    warranty = json['warranty'] ?? '';
    tags = json['tags'] ?? '';
    providerVendors = json['provider_vendors'] ?? '';

  }
}