import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/address_model.dart';
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
  Duration remainingTime = Duration(minutes: 20);

  Order order = Order()
    ..id = 1
    ..userId = 1
    ..orderDate = DateTime.now()
    ..storeName = "دیلی مارکت آباده"
    ..deliveryUserName = "علی رضایی"
    ..deliveryUserPhone = "0912-345-6789"
    ..trackingId = "190-118687-386"
    ..totalPrice = 105000
    ..discount = 76000
    ..itemPrice = 169400
    ..deliveryCost = 6500
    ..preparationCost = 6500
    ..deliveryAddresses = [
      Address()..address = "میدان آزادی، خیابان تلاش، کوچه هفتم",
    ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
    double progress = 1 - (remainingTime.inSeconds / 1200);
    String timerText =
        "${remainingTime.inMinutes.remainder(60)}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}";
    String deliveryAddress = order.deliveryAddresses.isNotEmpty
        ? order.deliveryAddresses.first.address
        : 'آدرسی ثبت نشده است';

    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        title: const Text(
          "پیگیری سفارش",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "جزئیات سفارش",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "اطلاعات پیک موتوری",
                              ),
                              Text(
                                order.deliveryUserName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                order.deliveryUserPhone,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " شماره تلفن :",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            order.deliveryUserPhone,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("مدت زمان تحویل:"),
                            Text(
                              timerText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.green,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.grey.shade300),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "آدرس",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                deliveryAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "فروشگاه",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          order.storeName,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "زمان ثبت سفارش",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${order.orderDate}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "شناسه پیگیری",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    order.trackingId,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
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
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.sms_outlined,
                            color: Colors.deepOrange,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "ثبت امتیاز و بازخورد",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "سبد خرید",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "جزئیات پرداخت",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "قیمت کالاها",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "هزینه ارسال",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
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
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "هزینه آماده سازی",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.radio_button_on_sharp,
                            color: Colors.deepOrange,
                          )
                        ],
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
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "تخفیف کالاها",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${order.discount}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Image.asset(
                            "assets/images/toman.png",
                            width: 15,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "قیمت قابل پرداخت",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
