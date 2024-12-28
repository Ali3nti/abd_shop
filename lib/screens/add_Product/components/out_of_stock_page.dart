import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class OutOfStockPage extends StatefulWidget {
  const OutOfStockPage({super.key});

  @override
  State<OutOfStockPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<OutOfStockPage> {
  List<Order> orders = List.generate(10, (index) {
    Order order = Order();
    order.id = index + 1;
    order.userId = 1;
    order.products = List.generate(3, (productIndex) {
      Product product = Product();
      product.id = productIndex + 1;
      product.name = 'محصول ${index + 1}-${productIndex + 1}';
      product.image = "assets/images/p${productIndex % 3 + 1}.png";
      return product;
    });
    return order;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "اتمام موجودی",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          Order order = orders[index];
          return Container(
            margin: const EdgeInsets.all(5),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.products[0].name,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      order.products[0].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
          },
      ),
    );
  }
}