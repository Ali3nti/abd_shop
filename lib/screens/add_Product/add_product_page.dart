import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/add_Product/components/add_product_to_list_page.dart';
import 'package:abd_shop/screens/add_Product/components/all_product_page.dart';
import 'package:abd_shop/screens/add_Product/components/new_order_page.dart';
import 'package:abd_shop/screens/add_Product/components/out_of_stock_page.dart';
import 'package:abd_shop/screens/add_Product/components/sent_page.dart';
import 'package:abd_shop/screens/home/components/app_Bar/app_Bar_Original.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  List<Product> products = List.generate(5, (index) {
    Product product = Product();
    product.id = index + 1;
    product.name = "محصول ${index + 1}";
    product.description = "توضیحات محصول ${index + 1}";
    product.image = "assets/images/p${index % 3 + 1}.png";
    return product;
  });

  List<Order> orders = List.generate(5, (index) {
    Order order = Order();
    order.id = index + 1;
    order.userId = 1;
    order.orderDate = DateTime.now().subtract(Duration(days: index));
    order.products = List.generate(2, (productIndex) {
      Product product = Product();
      product.id = productIndex + 1; // اضافه کردن شناسه محصول
      product.image = "assets/images/p${productIndex % 3 + 1}.png";
      return product;
    });
    order.storeName = "دیلی مارکت آباده";
    return order;
  });

  @override
  Widget build(BuildContext context) {
    String storeName = orders.isNotEmpty ? orders.first.storeName : "نام فروشگاه";
    String storeImage = products.isNotEmpty ? products.first.image : "assets/images/p1.png";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "اضافه کردن محصول",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.store,
                  size: 30,
                ),
                Row(
                  children: [
                    Text(
                      storeName,
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
                        storeImage,
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
            color: Colors.white,
            height: 50,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllProductPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                    alignment: Alignment.center,
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color:Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "همه محصولات",
                      style: TextStyle(
                        color:Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewOrderPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color:Colors.orangeAccent,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "سفارشات جدید",
                      style: TextStyle(
                        color:Colors.orangeAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SentPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color:Colors.lightGreen,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "ارسال شده",
                      style: TextStyle(
                        color:Colors.lightGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OutOfStockPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color:Colors.red,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "اتمام موجودی",
                      style: TextStyle(
                        color:Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final relatedOrders = orders
                        .where((order) =>
                        order.products!.any((p) => p.id == product.id))
                        .toList();
                    return Container(
                      margin: const EdgeInsets.all(2),
                      color: Colors.white,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: Text(
                                relatedOrders.isNotEmpty
                                    ? "سفارش جدید"
                                    : "بدون سفارش",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      product.description,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    product.image,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 24,
                          ),
                        ),
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
}
