import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';

class SuccessfulPaymentPage extends StatefulWidget {
  const SuccessfulPaymentPage({super.key});

  @override
  State<SuccessfulPaymentPage> createState() => _SuccessfulPaymentPageState();
}

class _SuccessfulPaymentPageState extends State<SuccessfulPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("نتیجه پرداخت"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 2, bottom: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Celebration.png",
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/Succes-pay.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "کد رهگیری سفارش :",
                  style: kHintTextStyle,
                ),
                Text(
                  "456781",
                  style: kHintTextStyle,
                ),
              ],
            ),
            SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    child: Text(
                      "بازگشست به صفحه اصلی",
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 30,
                    width: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(right: 30, top: 5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    child: Text(
                      "پیگیری سفارش",
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 30,
                    width: 150,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
