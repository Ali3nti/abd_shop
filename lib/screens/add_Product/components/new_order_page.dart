import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/add_Product/components/order_items_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});

  @override
  State<NewOrderPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<NewOrderPage> {
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
          "سفارشات جدید",
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
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  OrderItemsPage(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          "آیتم های سفارش",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.navigate_next,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ],
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
