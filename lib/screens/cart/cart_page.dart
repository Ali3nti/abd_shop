import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "سبد خرید",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10),
                        width: 60,
                        height: 60,
                        child: Image.asset("assets/images/p8.png"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("جت مارت", style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text("|ونک", style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 190),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(Icons.navigate_next),
                              ),
                            ],),
                          Container(
                            margin: EdgeInsets.only(left: 160),
                            child: Row(
                              children: [
                                Icon(Icons.bike_scooter_sharp, size: 15,),
                                SizedBox(width: 5),
                                Text("6,500 تومان", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Text("45 دقیقه", style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,),
                                ),
                              ],),
                          ),
                        ],),
                    ],),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p16.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p12.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1, left: 10),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p7.png"),
                        ),
                        Column(
                          children: [
                            Icon(Icons.delete),
                            Text("حذف سبد خرید", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,),
                            ),
                          ],),
                      ],),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 170,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade900,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Text("ادامه خرید", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,),
                            ),
                          )),
                      SizedBox(width: 70,),
                      Column(
                        children: [
                          Text("جمع سبد خرید (3 مورد)", style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text("155.300 تومان", style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],),
                    ],),
                ],),
            ),
          ],),
      ),
    );
  }
}
