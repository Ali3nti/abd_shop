import 'package:abd_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  late Timer timer;
  Duration remainingTime = Duration(hours: 0, minutes: 30);

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = remainingTime - Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String timerText =
        "${remainingTime.inMinutes.remainder(60)}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}";

    double progress = remainingTime.inSeconds / (30 * 60);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 280,
                top: 20,
              ),
              child: Text(
                "پیگیری سفارش",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 290,
                top: 200,
              ),
              child: Text(
                "جزئیات سفارش",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              width: 480,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "سفارش تحویل داده شد",
                        style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.w900),
                      ),
                      Row(
                        children: [
                          Text("تحویل تا"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            timerText,
                            style: TextStyle(
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                    value: progress < 0 ? 0 : progress,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
            ),
            Text(
              "ارسال به خانه",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              "میدان آزادی،خیابان تلاش،کوچه هفتم",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "فروشگاه",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey),
                ),
                Text(
                  "دیلی مارکت /بلوار نصر >",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "زمان ثبت سفارش",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey),
                ),
                Text(
                  "جمعه،18آبان1403 19:42",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "شناسه پیگیری",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.grey),
                ),
                Text(
                  "190-118687-386",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6, left: 6, top: 6),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7, left: 7, top: 7),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.sms_outlined, color: Colors.deepOrange),
                        SizedBox(width: 10),
                        Text(
                          "ثبت امتیاز و بازخورد",
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), // Container for rate & comments
            SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              color: Colors.grey.shade300,
            ),
            Text("سبد خرید",style: TextStyle(fontWeight: FontWeight.w900),),
          ],
        ),
      ),
    );
  }
}
