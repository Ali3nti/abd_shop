import 'package:abd_shop/screens/cart/internet_payment.dart';
import 'package:abd_shop/widget/continue_cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContinueCartPage extends StatefulWidget {
  const ContinueCartPage({super.key});

  @override
  State<ContinueCartPage> createState() => _AllPageState();
}

class _AllPageState extends State<ContinueCartPage> {
  int _value = 1;
  int get val => val;

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(top: 20, right: 20),
              color: Colors.white,
              height: 50,
              width: double.infinity,
              child: const Text(
                "روش پرداخت",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: _value,
                    onChanged: (Val) {
                      setState(() {
                        _value = val;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text("پرداخت اینترنتی"),
                    subtitle: const Text("پرداخت آنلاین با تمامی کارت های بانکی"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: _value,
                    onChanged: (Val) {
                      setState(() {
                        _value = val;
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text(" کیف پول "),
                    subtitle: const Text(" اعتبار باقی مانده : 0 تومان"),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(top: 20, right: 20),
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: const Text(
                "جزییات قیمت",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "قیمت کالا",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 230),
                  const Text(
                    "184,000 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "هزینه ارسال",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 225),
                  const Text(
                    "9,000 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "هزینه آماده سازی",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 195),
                  const Text(
                    "2,500 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "تخفیف کالاها",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 220),
                  const Text(
                    "43,900 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              width: 380,
              color: Colors.grey.shade300,
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: const Row(
                children: [
                  Text(
                    "مبلغ قابل پرداخت",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 175),
                  Text(
                    "151,600 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              color: Colors.white,
              height: 100,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(right: 20),
                    child: const Row(
                      children: [
                        Text(
                          "مبلغ قابل پرداخت",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "جزییات",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 115),
                        Text(
                          "151,600 تومان",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
                      height: 40,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "پرداخت اینترنتی",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
