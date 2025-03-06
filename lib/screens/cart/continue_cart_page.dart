import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/screens/cart/cart_page.dart';
import 'package:abd_shop/screens/cart/internet_payment.dart';
import 'package:abd_shop/screens/orders/order_tracking_page.dart';
import 'package:abd_shop/widget/continue_cart_widget.dart';
import 'package:flutter/material.dart';

class ContinueCartPage extends StatefulWidget {
  const ContinueCartPage({super.key});

  @override
  State<ContinueCartPage> createState() => _AllPageState();
}

class _AllPageState extends State<ContinueCartPage> {
  int _value = 1;
  Order order = Order()
    ..id = 1
    ..userId = 1
    ..totalPrice = 105000
    ..discount = 76000
    ..itemPrice = 169400
    ..deliveryCost = 6500
    ..preparationCost = 6500;
  @override
  Widget build(BuildContext context) {
    String paymentMethodText = _value == 1 ? "پرداخت اینترنتی" : "کیف پول";

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          'پرداخت',
          style: TextStyle(color: kWhiteColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContinueCartWidget(),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(top: 20, right: 20),
              color: Colors.white,
              height: 50,
              width: double.infinity,
              child: const Text(
                "روش پرداخت",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text(
                      "پرداخت اینترنتی",
                    ),
                    subtitle: const Text(
                      "پرداخت آنلاین با تمامی کارت های بانکی",
                    ),
                  ),
                  const SizedBox(height: 5),
                  RadioListTile(
                    value: 2,
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text("کیف پول"),
                    subtitle: const Text("اعتبار باقی مانده : 0 تومان"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(top: 20, right: 20),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: const Text(
                "جزییات قیمت",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "قیمت کالا",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        formatter.format(order.itemPrice),
                        style: kHeaderTextStyle,
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "هزینه ارسال",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        formatter.format(order.deliveryCost),
                        style: kHeaderTextStyle,
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "هزینه آماده سازی",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        formatter.format(order.preparationCost),
                        style: kHeaderTextStyle,
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تخفیف کالاها",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        formatter.format(order.discount),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor
                        ),
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 20,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              height: 200,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderTrackingPage(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "قیمت قابل پرداخت",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "جزییات",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              formatter.format(order.totalPrice),
                              style: kHeaderTextStyle,
                            ),
                            Image.asset(
                              "assets/images/toman.png",
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InternetPayment(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: Text(
                          "  $paymentMethodText",
                          style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}



