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

  LatLng? origin;
  LatLng? destination;

  @override
  Widget build(BuildContext context) {
    String timerText =
        "${remainingTime.inMinutes.remainder(60)}:${(remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0')}";

    double progress = remainingTime.inSeconds / (30 * 60);

    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 280),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "پیگیری سفارش",
                  style: kHeaderTextStyle,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 300,
            //     child: FlutterMap(
            //       options: MapOptions(
            //         initialCenter: LatLng(31.1611, 52.6488),
            //         //ABADEH LOCATION!!!!!!//
            //         minZoom: 10.0,
            //         onTap: (tapPosition, point) {
            //           setState(() {
            //             if (origin == null) {
            //               origin = point;
            //             } else if (destination == null) {
            //               destination = point;
            //             } else {
            //               origin = point;
            //               destination = null;
            //             }
            //           });
            //         },
            //       ),
            //       children: [
            //         TileLayer(
            //           urlTemplate:
            //               "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            //           subdomains: ['a', 'b', 'c'],
            //         ),
            //         MarkerLayer(
            //           markers: [
            //             if (origin != null)
            //               Marker(
            //                 point: origin!,
            //                 child: Icon(Icons.location_on,
            //                     color: Colors.blue, size: 40),
            //               ),
            //             if (destination != null)
            //               Marker(
            //                 point: destination!,
            //                 child: Icon(Icons.location_on, color: Colors.red),
            //               ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Center(
              child: Image.asset("assets/images/order_prepare.png"),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Image.asset("assets/images/16.png"),
            ),
            Center(
              child: Image.asset("assets/images/deliverd.png"),
            ),

            Padding(
              padding: EdgeInsets.only(left: 290),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
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
                              Text("اطلاعات پیک موتوری"),
                              Text(
                                "علی رضایی",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                              Text(
                                "@AliRezaei",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
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
                            "شماره تلفن:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "0912-345-6789",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
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
            Divider(
              thickness: 3,
            ),
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
                      Icon(Icons.radio_button_on_sharp,
                          color: Colors.deepOrange)
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
                      Image.asset("assets/images/toman.png",
                          width: 15, color: Colors.deepOrange)
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "قیمت قابل پرداخت",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "105,000",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.green.shade900),
                      ),
                      Image.asset("assets/images/toman.png",
                          width: 15, color: Colors.green.shade900)
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
