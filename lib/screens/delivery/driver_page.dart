import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/delivery/delivery_page.dart';
import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 30),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/212.png",
                      width: 62,
                      height: 62,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "سلام امیر!",
                        style: kHeaderTextStyle,
                      ),
                      Text(
                        "بریم سراغ یه روز کاری جدید",
                        style: TextStyle(
                            color: kGreenColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/bing.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TabBar(
              indicatorColor: Colors.teal,
              labelColor: Colors.teal,
              tabs: [
                Tab(
                  text: 'تاریخچه سفارشات',
                ),
                Tab(text: 'سفارش جدید'),
                Tab(text: 'کیف پول من'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("آیدی سفارش : #212546"),
                                  Text(
                                    "20/8/1403",
                                    style: TextStyle(color: kRedColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("3 آیتم"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("آیدی سفارش : #212546"),
                                  Text(
                                    "20/8/1403",
                                    style: TextStyle(color: kRedColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("3 آیتم"),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("آیدی سفارش : #212546"),
                                  Text(
                                    "20/8/1403",
                                    style: TextStyle(color: kRedColor),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text("3 آیتم"),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DeliveryDriverPage(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "موجودی کیف پول:",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "200,000 تومان",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "آخرین بروزرسانی: 25 آذر 1403",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "تاریخچه تراکنش‌ها:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text("واریز به کیف پول"),
                                subtitle: Text("24 آذر 1403"),
                                trailing: Text(
                                  "+50,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text("برداشت از کیف پول"),
                                subtitle: Text("23 آذر 1403"),
                                trailing: Text(
                                  "-30,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text("واریز به کیف پول"),
                                subtitle: Text("22 آذر 1403"),
                                trailing: Text(
                                  "+100,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
