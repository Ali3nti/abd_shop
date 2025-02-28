import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class SentPage extends StatefulWidget {
  const SentPage({super.key});

  @override
  State<SentPage> createState() => _SentPageState();
}

class _SentPageState extends State<SentPage> {
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
        backgroundColor: Colors.green,
        title: const Text(
          "سفارشات ارسال شده",
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
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
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
                            color: Colors.green,
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
                    width: 80,
                    height: 80,
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
