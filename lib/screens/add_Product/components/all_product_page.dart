import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  List<Order> orders = List.generate(10, (index) {
    Order order = Order();
    order.id = index + 1;
    order.userId = 1;
    order.trackingId = 'ABD-0000$index';
    order.orderDate = DateTime.now().subtract(Duration(days: index));
    order.products = List.generate(3, (productIndex) {
      Product product = Product();
      product.id = productIndex + 1;
      product.name = 'محصول ${index + 1}-${productIndex + 1}';
      product.isInStock = productIndex != 1;
      product.isShipped = index % 2 == 0;
      return product;
    });
    return order;
  });

  String formatPersianDate(DateTime date) {
    final gregorianDate = Gregorian(date.year, date.month, date.day);
    final jalaliDate = Jalali.fromGregorian(gregorianDate);
    final formattedDate =
        '${jalaliDate.day} / ${jalaliDate.month} / ${jalaliDate.year}';
    final formattedDay = DateFormat('EEEE', 'fa_IR').format(date);
    final formattedTime = DateFormat('HH:mm').format(date);
    return '$formattedDay $formattedDate _ $formattedTime';
  }

  String getOrderStatus(Order order) {
    if (order.products.any((product) => product.isInStock)) {
      return "سفارش جدید";
    } else if (order.products.every((product) => !product.isInStock)) {
      return "اتمام موجودی";
    } else if (order.products.any((product) => product.isShipped)) {
      return "ارسال شده";
    } else {
      return "وضعیت نامشخص";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "همه محصولات",
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.products[0].name,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          order.trackingId,
                        ),
                        Text(
                          formatPersianDate(
                            order.orderDate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                    child: Text(
                      getOrderStatus(order),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
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
