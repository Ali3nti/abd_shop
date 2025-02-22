import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class OrderItemsPage extends StatefulWidget {
  const OrderItemsPage({super.key});

  @override
  State<OrderItemsPage> createState() => _SentPageState();
}

class _SentPageState extends State<OrderItemsPage> {
  List<Order> orders = List.generate(10, (index) {
    Order order = Order();
    order.id = index + 1;
    order.userId = 1;
    order.trackingId = 'ABD-0000$index';
    order.orderDate = DateTime.now().subtract(Duration(days: index));
    order.products = List.generate(3 + index, (productIndex) {
      Product product = Product();
      product.id = productIndex + 1;
      product.name = 'محصول ${index + 1}-${productIndex + 1}';
      product.image = "assets/images/p${productIndex % 3 + 1}.png";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "آیتم های سفارش",
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          Order order = orders[index];
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${order.products.length} آیتم',
                    style: const TextStyle(
                      color: kPrimaryColor,
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
                  SizedBox(height: 8),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: order.products.length,
                      itemBuilder: (context, productIndex) {
                        return Container(
                          margin: EdgeInsets.only(left: 4, right: 4),
                          width: 60,
                          child: Image.asset(
                            order.products[productIndex].image,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
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
