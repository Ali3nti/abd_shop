import 'package:flutter/material.dart';

class BestProducts extends StatelessWidget {
  const BestProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text("پرفروش ترین کالاها"),
        ),
        Container(
          height: 500,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool6.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("روغن سرخ کردنی بدون پالم بهار"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool5.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی اسپرایت"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool4.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی لیمو باربیکن"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool3.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("تخم مرغ بسته 6تایی"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool6.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("روغن سرخ کردنی بدون پالم بهار"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool5.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی اسپرایت"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool4.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی لیمو باربیکن"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool3.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("تخم مرغ بسته 6تایی"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool6.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("روغن سرخ کردنی بدون پالم بهار"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool5.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی اسپرایت"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool4.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نوشیدنی لیمو باربیکن"),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mahsool3.png",
                          width: 80,
                        ),
                        Container(width: 30,height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("تخم مرغ بسته 6تایی"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
