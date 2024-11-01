class Product {
  String id;
  String name;
  String categoryId;
  double price;
  String description;
  int stockQuantity;
  String unit;
  String brand;
  bool isActive;
  double weight;
  String dimensions;
  String color;
  double rating;
  int reviewCount;
  double discount;
  DateTime? offerStart;
  DateTime? offerEnd;
  String warranty;
  List<String> tags;
  String providerVendors;
  String productUrl;
  String imageUrl; // لینک عکس

  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.description,
    required this.stockQuantity,
    required this.unit,
    required this.brand,
    required this.isActive,
    required this.weight,
    required this.dimensions,
    required this.color,
    required this.rating,
    required this.reviewCount,
    required this.discount,
    this.offerStart,
    this.offerEnd,
    required this.warranty,
    required this.tags,
    required this.providerVendors,
    required this.productUrl,
    required this.imageUrl, // لینک عکس
  });
}
