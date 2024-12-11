import 'package:abd_shop/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
  LatLng? origin; // مبدا
  LatLng? destination; // مقصد
  @override
  Widget build(BuildContext context) {
    String timerText =
        "${remainingTime.inMinutes.remainder(60)}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}";

    double progress = remainingTime.inSeconds / (30 * 60);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 280, top: 20),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "پیگیری سفارش",
                  style: kHeaderTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                child:
                FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(31.1611, 52.6488), //ABADEH LOCATION!!!!!!//
                    minZoom: 10.0,
                    onTap: (tapPosition, point) {
                      setState(() {
                        if (origin == null) {
                          origin = point;
                        } else if (destination == null) {
                          destination = point;
                        } else {
                          origin = point;
                          destination = null;
                        }
                      });
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        if (origin != null)
                          Marker(
                            point: origin!,
                            child:Icon(Icons.location_on, color: Colors.blue, size: 40),
                          ),
                        if (destination != null)
                          Marker(
                            point: destination!,
                            child:Icon(Icons.location_on, color: Colors.red),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )

            ,

            Padding(
              padding: EdgeInsets.only(left: 290,),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "جزئیات سفارش",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                width: 480,
                height: 60,
                child: Card(
                  color: Colors.greenAccent.shade100,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "سفارش تحویل داده شد",
                              style: TextStyle(
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("تحویل تا"),
                                SizedBox(width: 5),
                                Text(
                                  timerText,
                                  style: TextStyle(
                                      color: Colors.green.shade900,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 380,
                        child: LinearProgressIndicator(
                          value: progress < 0 ? 0 : progress,
                          backgroundColor: Colors.white,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ارسال به خانه",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "میدان آزادی،خیابان تلاش،کوچه هفتم",
                style: TextStyle(fontWeight: FontWeight.w900),
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
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "دیلی مارکت /بلوار نصر",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.blue),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.sms_outlined, color: Colors.deepOrange),
                          SizedBox(width: 10),
                          Text(
                            "ثبت امتیاز و بازخورد",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(height: 4, color: Colors.grey.shade300),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "سبد خرید",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 8),
              child: Text(
                "جزئیات پرداخت",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "قیمت کالاها",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "169,400",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Image.asset("assets/images/toman.png", width: 15)
                    ],
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
                    "هزینه ارسال",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "6,500",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Image.asset("assets/images/toman.png", width: 15)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "هزینه آماده سازی",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.grey),
                      ),
                      Icon(Icons.radio_button_on_sharp, color: Colors.deepOrange)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "6,500",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Image.asset("assets/images/toman.png", width: 15)
                    ],
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
                    "تخفیف کالاها",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "76,000",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.deepOrange),
                      ),
                      Image.asset("assets/images/toman.png", width: 15, color: Colors.deepOrange)
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 4, color: Colors.grey.shade300),

            // افزودن نقشه OpenStreetMap
          ],
        ),
      ),
    );
  }
}
