import 'package:abd_shop/screens/cart/failed_pay.dart';
import 'package:abd_shop/screens/cart/successful_payment_page.dart';
import 'package:flutter/material.dart';

class InternetPayment extends StatefulWidget {
  const InternetPayment({super.key});

  @override
  State<InternetPayment> createState() => _InternetPaymentState();
}

class _InternetPaymentState extends State<InternetPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessfulPaymentPage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(100),
                child: Container(
                  padding: EdgeInsets.only(right: 30, top: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadiusDirectional.circular(5),
                  ),
                  child: Text(
                    "پرداخت موفق",
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 30,
                  width: 150,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => failedPaymentPage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.only(right: 30, top: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade800,
                    borderRadius: BorderRadiusDirectional.circular(5),
                  ),
                  child: Text(
                    "پرداخت ناموفق",
                    style: TextStyle(color: Colors.white),
                  ),
                  height: 30,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
