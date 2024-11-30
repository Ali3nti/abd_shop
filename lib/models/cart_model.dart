import 'package:abd_shop/models/product_model.dart';

class Cart {
  int id = 0;
  Product product = Product();
  int count = 0;
  int sumPrice = 0;

  Cart({
    required this.id,
    required this.product,
    required this.count,
  });
}
