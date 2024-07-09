import 'package:abd_shop/screens/cart/internet_payment.dart';
import 'package:abd_shop/widget/checkbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ContinueCartPage extends StatefulWidget {
  const ContinueCartPage({super.key});

  @override
  State<ContinueCartPage> createState() => _ContinueCartPageState();
}

class _ContinueCartPageState extends State<ContinueCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "پرداخت",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              color: Colors.white,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 130,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  // color: Colors.orange,
                                  child: const Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        "ارسال به",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "م . ونک...",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, left: 40),
                                  //color: Colors.orange,
                                  child: Text(
                                    "م. ونک",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                                // SizedBox(height: 10,),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 10, right: 20),
                                  child: const Text(
                                    "تغییر آدرس تحویل",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 150),
                    width: 110,
                    height: 130,
                    //color: Colors.red,
                    child: Image.asset("assets/images/jet mart.webp",),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              color: Colors.white,
              height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    //color: Colors.yellowAccent,
                    height: 50,
                    width: double.infinity,
                    child: const Text(
                      "روش پرداخت",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //color: Colors.lightGreen,
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                         margin: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.circle_outlined),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30, left: 80),
                              child: const Text(
                                "پرداخت اینترنتی",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // SizedBox(height: 10,),
                            Container(
                             margin: const EdgeInsets.only(right: 30),
                              child:  Text(
                                  "پرداخت آنلاین با تمامی کارت های بانکی",
                              style: TextStyle(color: Colors.grey.shade700 ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 5),
                    height: 2,
                    width: 380,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                     //color: Colors.orange,
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.circle_outlined),),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 60),
                              child: const Text(
                                "کیف پول",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            // SizedBox(height: 10,),
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              child:  Row(
                                children: [
                                  Text("اعتبار باقی مانده : ", style: TextStyle(
                                  color: Colors.grey.shade700),),
                                  Text("0 تومان "),
                             ], ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(top: 20, right: 20),
              color: Colors.white,
              height: 50,
              width: double.infinity,
              child: const Text(
                "جزییات قیمت",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "قیمت کالا",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 230),
                  const Text(
                    "184,000 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "هزینه ارسال",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 225),
                  const Text(
                    "9,000 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "هزینه آماده سازی",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 195),
                  const Text(
                    "2,500 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  Text(
                    "تخفیف کالاها",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                  ),
                  const SizedBox(width: 220),
                  const Text(
                    "43,900 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              width: 380,
              color: Colors.grey.shade300,
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 50,
              child: const Row(
                children: [
                  Text(
                    "مبلغ قابل پرداخت",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 175),
                  Text(
                    "151,600 تومان",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              color: Colors.white,
              height: 100,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(right: 20),
                    child: const Row(
                      children: [
                        Text(
                          "مبلغ قابل پرداخت",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "جزییات",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 115),
                        Text(
                          "151,600 تومان",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InternetPayment(),
                        ),);},
                    child: Container(
                      height: 40,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "پرداخت اینترنتی",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],),
      ),
    );
  }
}
