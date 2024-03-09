import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        actions: [
          //Icon(Icons.close),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.topRight,
                  child: Text(
                    "تخفیف کهکشانی", style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 150,
                  height: 200,
                  child: Image.asset("assets/images/p1.png", fit: BoxFit.contain),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.asset(
                        "assets/images/p11.png",
                        width: 40,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "اسم فروشگاه / آدرس",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    "اسنک طلایی چی توز - 190 گرم ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 70,
                  color: Colors.grey.shade100,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 70,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/p11.png",
                              width: 40,
                              height: 30,
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Text(
                              "پفک و اسنک",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
               SizedBox(height: 30),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 20),
                  child:Column(
                    children: [
                      Text("توضیحات", style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("190 گرم", style: TextStyle(
                        fontSize:14,),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade100,
            height: 70,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("اضافه به سبد", style:
                    TextStyle(color: Colors.white,
                        fontSize: 14 , fontWeight: FontWeight.bold),)
                ),
                SizedBox(width: 110),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "30 %",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child:
                            Text("35,350",
                                  style: TextStyle(fontSize: 14)),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  child: Image.asset("assets/images/toman.png",
                                    width: 15, height: 15,),
                                ),
                        ],  ),
                      Container(
                        margin: EdgeInsets.only(right: 70),
                          child:Text("50.500", style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                            color: Colors.grey
                      ),)
    ),
                        ],),
                  ),
                ],),
                  ),
              ]  ),
            );
  }
}



