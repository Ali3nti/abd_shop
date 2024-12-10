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

    // محاسبه درصد باقی‌مانده
    double progress = remainingTime.inSeconds / (30 * 60);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              width: 380,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          SizedBox(width: 5,),
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
          ],
        ),
      ),
    );
  }
}
