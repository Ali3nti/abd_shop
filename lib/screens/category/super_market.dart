import 'package:abd_shop/screens/home/components/amazing_item_widget.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SuperMarket extends StatefulWidget {
  const SuperMarket({super.key});

  @override
  State<SuperMarket> createState() => _SuperMarketState();
}

class _SuperMarketState extends State<SuperMarket> {
  @override
  Widget build(BuildContext context) {
    var large;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset("assets/images/logo.png",
                      color: Colors.deepOrange,),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(" جت مارت | ونک ", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,),),
                      Icon(Icons.navigate_next),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(" تا50% ", style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,),),
                      ),
                    ],),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow.shade700, size: 18,),
                      Text("4.6   . ", style: TextStyle(
                        fontSize: 16,
                          fontWeight: FontWeight.bold,),),
                      Text(" + 1000 رای", style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,),),
                    ],),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("ارسال در ", style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,),),
                      Text("45  دقیقه  .  ", style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,),),
                      Text("هزینه ارسال ", style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,),),
                      Text("6,000 تومان", style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,),),
                    ],),
                ],),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "میوه",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "صیفی جات",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "سبزیجات",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "میوه خاص",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "میوه و صیفی جات اقتصادی",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "ادویه و چاشنی ها",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "ترشیجات و شوریجات",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "آبمیوه طبیعی",
                        )),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "کمپوت و کنسویجات",
                        )),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 400,
              color: Colors.orange,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 400,
                      color: Colors.orange,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              "شگفت",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "انگیزهای",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "امروز",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 200,
                              height: 200,
                              //color: Colors.yellow,
                              child: Image.asset(
                                "assets/images/amazing.jpg",
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 60),
                              //height: 30,
                              child: Row(
                                children: [
                                  Text(
                                    "همه",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Icon(Icons.navigate_next,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 350,
                      child: AmazingItemWidget(),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 350,
                      child: AmazingItemWidget(),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 350,
                      child: AmazingItemWidget(),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    direction: Axis.horizontal,
                    children: [
                      CategoryBox(
                        categorytext: Text("لبنیات و بستنی"),
                        img: "assets/images/Market.png",
                      ),
                      CategoryBox(
                        categorytext: Text("تنقلات"),
                        img: "assets/images/p8.png",
                      ),
                      CategoryBox(
                        categorytext: Text("نوشیدنی"),
                        img: "assets/images/p7.png",
                      ),
                      CategoryBox(
                        categorytext: Text("نان"),
                        img: "assets/images/p12.png",
                      ),
                      CategoryBox(
                        categorytext: Text("خواربار"),
                        img: "assets/images/p11.png",
                      ),
                      CategoryBox(
                        categorytext: Text("میوه و سبزیجات"),
                        img: "assets/images/Fruite.png",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 460,
              color: Colors.amber.shade100,
              child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 30,),
                            Text(
                              "حراج روز", style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 250,),
                            Text("همه", style: TextStyle(fontSize: 18, color: Colors.blue),),
                            Icon(Icons.navigate_next, color: Colors.blue),
                          ],),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 400,
                                color: Colors.amber,
                                child: AmazingItemWidget(),
                              ),
                              Container(
                                height: 400,
                                color: Colors.amber,
                                child: AmazingItemWidget(),
                              ),
                              Container(
                                height: 400,
                                color: Colors.amber,
                                child: AmazingItemWidget(),
                              ),
                            ],),
                        ),
                      ],),
                  ),
            SizedBox(height: 10,),
            Container(
              height: 460,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "لبنیات و بستنی", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 250,),
                      Text("همه", style: TextStyle(fontSize: 18, color: Colors.blue),),
                      Icon(Icons.navigate_next, color: Colors.blue),
                    ],),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                      ],),
                  ),
                ],),
            ),
            SizedBox(height: 10,),
            Container(
              height: 460,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "تنقلات", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(width: 290,),
                      Text("همه", style: TextStyle(fontSize: 18, color: Colors.blue),),
                      Icon(Icons.navigate_next, color: Colors.blue),
                    ],),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                      ],),
                  ),
                ],),
            ),
            SizedBox(height: 10,),
            Container(
              height: 460,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "نوشیدنی", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(width: 270,),
                      Text("همه", style: TextStyle(fontSize: 18, color: Colors.blue),),
                      Icon(Icons.navigate_next, color: Colors.blue),
                    ],),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                        Container(
                          height: 400,
                          color: Colors.amber,
                          child: AmazingItemWidget(),
                        ),
                      ],),
                  ),
                ],),
            ),
                ],
              ),
            ),

    );
  }
}
