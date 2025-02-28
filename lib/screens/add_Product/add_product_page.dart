import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/add_Product/components/add_product_to_list_page.dart';
import 'package:abd_shop/screens/add_Product/components/new_order_page.dart';
import 'package:abd_shop/screens/add_Product/components/out_of_stock_page.dart';
import 'package:abd_shop/screens/add_Product/components/sent_page.dart';
import 'package:abd_shop/screens/home/components/app_Bar/app_Bar_Original.dart';
import 'package:flutter/material.dart';

enum ProductStatus {
  newOrder,
  outOfStock,
  shipped,
  noOrder,
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late List<Product> _products;
  late List<Order> _orders;
  bool _isLoading = true;
  String _storeName = "نام فروشگاه";
  String _storeImage = "assets/images/store_default.png";

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await Future.delayed(const Duration(seconds: 1));
    _products = _generateInitialProducts();
    _orders = _generateInitialOrders();

    if (_orders.isNotEmpty) {
      _storeName = _orders.first.storeName;
    }

    if (_products.isNotEmpty) {
      _storeImage = _products.first.image;
    }

    setState(() {
      _isLoading = false;
    });
  }

  List<Product> _generateInitialProducts() {
    return List.generate(5, (index) {
      Product product = Product();
      product.id = index + 1;
      product.name = "محصول ${index + 1}";
      product.description = "توضیحات محصول ${index + 1}";
      product.image = "assets/images/p${index % 3 + 1}.png";
      product.isInStock = !(index % 2 == 0);
      product.isShipped = (index % 3 == 0);
      return product;
    });
  }

  List<Order> _generateInitialOrders() {
    return List.generate(5, (index) {
      Order order = Order();
      order.id = index + 1;
      order.userId = 1;
      order.orderDate = DateTime.now().subtract(Duration(days: index));
      order.products = List.generate(2, (productIndex) {
        Product product = Product();
        product.id = productIndex + 1;
        product.image = "assets/images/p${productIndex % 3 + 1}.png";
        return product;
      });
      order.storeName = "دیلی مارکت آباده";
      return order;
    });
  }

  void _removeProduct(int productId) {
    setState(() {
      _products.removeWhere((product) => product.id == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "اضافه کردن محصول",
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: kWhiteColor,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.store, size: 30),
                      Row(
                        children: [
                          Text(
                            _storeName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              _storeImage,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const AppBarOriginal(),
                const SizedBox(height: 5),
                Container(
                  color: kWhiteColor,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavigationButton(context, "سفارشات جدید",
                          kPrimaryColor, const NewOrderPage()),
                      _buildNavigationButton(
                          context, "ارسال شده", Colors.green, const SentPage()),
                      _buildNavigationButton(context, "اتمام موجودی",
                          Colors.red, const OutOfStockPage()),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final product = _products[index];
                          final relatedOrders = _orders
                              .where((order) =>
                                  order.products.any((p) => p.id == product.id))
                              .toList();
                          return _buildProductCard(product, relatedOrders);
                        },
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AddProductToListPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildNavigationButton(
      BuildContext context, String title, Color color, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kWhiteColor,
          foregroundColor: color,
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.30, 40),
        ),
        child: Text(title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  ProductStatus _getProductStatus(Product product, List<Order> relatedOrders) {
    if (relatedOrders.isNotEmpty) {
      return ProductStatus.newOrder;
    } else if (!product.isInStock) {
      return ProductStatus.outOfStock;
    } else if (product.isShipped) {
      return ProductStatus.shipped;
    } else {
      return ProductStatus.noOrder;
    }
  }

  String _getStatusMessage(ProductStatus status) {
    switch (status) {
      case ProductStatus.newOrder:
        return "سفارش جدید";
      case ProductStatus.outOfStock:
        return "اتمام موجودی";
      case ProductStatus.shipped:
        return "ارسال شده";
      case ProductStatus.noOrder:
        return "بدون سفارش";
    }
  }

  Color _getStatusColor(ProductStatus status) {
    switch (status) {
      case ProductStatus.newOrder:
        return kPrimaryColor;
      case ProductStatus.outOfStock:
        return Colors.red;
      case ProductStatus.shipped:
        return Colors.green;
      case ProductStatus.noOrder:
        return Colors.grey;
    }
  }

  Widget _buildProductCard(Product product, List<Order> relatedOrders) {
    final status = _getProductStatus(product, relatedOrders);
    final statusMessage = _getStatusMessage(status);
    final statusColor = _getStatusColor(status);

    return Container(
      margin: const EdgeInsets.all(2),
      color: kWhiteColor,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onLongPress: () {
                _removeProduct(product.id);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("محصول ${product.name} حذف شد")));
              },
              child: Container(
                alignment: Alignment.center,
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: statusColor,
                ),
                child: Text(
                  statusMessage,
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Image.asset(
                  product.image,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
