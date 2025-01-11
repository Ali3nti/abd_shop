import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/screens/cart/internet_payment.dart';
import 'package:abd_shop/screens/orders/order_Tracking_Page.dart';
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
          "پرداخت",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                        "${order.itemPrice}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 15,
                        color: Colors.green.shade900,
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
                        "${order.deliveryCost}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 15,
                        color: Colors.green.shade900,
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
                        "${order.preparationCost}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 15,
                        color: Colors.green.shade900,
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
                        "${order.discount}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Image.asset(
                        "assets/images/toman.png",
                        width: 15,
                        color: Colors.green.shade900,
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
                              "${order.totalPrice}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.green.shade900,
                              ),
                            ),
                            Image.asset(
                              "assets/images/toman.png",
                              width: 15,
                              color: Colors.green.shade900,
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
                      height: 60,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "  $paymentMethodText",
                          style: const TextStyle(
                            color: Colors.white,
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
