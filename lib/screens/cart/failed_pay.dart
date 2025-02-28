import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';

class FailedPaymentPage extends StatefulWidget {
  const FailedPaymentPage({super.key});

  @override
  State<FailedPaymentPage> createState() => _FailedPaymentPageState();
}

class _FailedPaymentPageState extends State<FailedPaymentPage> {
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
              "assets/images/failed-pay2.png",
            ),
            SizedBox(
              height: 25,
            ),
            Image.asset(
              "assets/images/failed-pay.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "کد پیگیری تراکنش شما :",
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
                      color: Colors.red.shade800,
                      borderRadius: BorderRadiusDirectional.circular(5),
                    ),
                    child: Text(
                      "پرداخت مجدد",
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
