import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/screens/Base/base_page.dart';
import 'package:abd_shop/screens/orders/order_Tracking_Page.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // لیست سفارشات
  List<Order> orders = List.generate(
    10,
        (index) => Order(
      id: index + 1,
      userId: 1,
      products: [], // می‌توانید محصولات را اضافه کنید
      totalPrice: 200000.0,
      orderStatus: 'در حال پردازش',
      orderDate: DateTime.now().subtract(Duration(days: index)), // تاریخ‌های مختلف
      shippingAddress: 'آدرس نمونه',
      paymentMethod: 'کارت بانکی',
      trackingNumber: 'TRACK123${index + 1}',
      comments: 'نظرات اضافی',
      discount: 0.0,
      deliveryDate: DateTime.now().add(Duration(days: 3)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سفارش های من",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: orders.isNotEmpty
            ? ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Container(
              margin: const EdgeInsets.all(10),
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset("assets/images/p8.png"),
                            ),
                            const Text(
                              "جت مارکت",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "|ونک",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OrderTrackingPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "جزییات سفارش",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.navigate_next,
                              color: Colors.blue,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("تاریخ: ${order.orderDate.toLocal()}"),
                        Row(
                          children: [
                            Text("${order.totalPrice}"),
                            Image.asset(
                              width: 15,
                              'assets/images/toman.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // نمایش محصولات (اگر موجود باشد)
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: List.generate(
                        order.products.length > 3 ? 3 : order.products.length,
                            (productIndex) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p16.png"), // تصویر محصول
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 7, left: 7, top: 15),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.deepOrange,
                            width: 3,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sms_outlined,
                              color: Colors.deepOrange,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "ثبت امتیاز و بازخورد",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
            : Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 60, top: 30),
              height: 300,
              width: 300,
              child: Image.asset("assets/images/P31.png"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, top: 2),
              child: const Text(
                "اینجا سفارش ندارید!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, top: 10),
              child: const Text(
                "چندین فروشگاه دیگر نزدیک شما هستند.",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasePage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 70, top: 30),
                width: 210,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "مشاهده فروشگاه های نزدیک",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
