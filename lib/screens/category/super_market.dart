import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/price_widget.dart';
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
              color: Colors.yellow,
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
                    child: Image.asset(
                      "assets/images/logo.png",
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        " جت مارت | ونک ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.navigate_next),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          " تا50% ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 18,
                      ),
                      Text(
                        "4.6   . ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " + 1000 رای",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "ارسال در ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "45  دقیقه  .  ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "هزینه ارسال ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "6,000 تومان",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    OutlinedButton(
                        onPressed:(){},
                                      child: Text("میوه",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("صیفی جات",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("سبزیجات",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("میوه خاص",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("میوه و صیفی جات اقتصادی",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("ادویه و چاشنی ها",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("ترشیجات و شوریجات",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("آبمیوه طبیعی",)),
                    SizedBox(width: 5),
                    OutlinedButton(
                        onPressed:(){},
                        child: Text("کمپوت و کنسویجات",)),
                    SizedBox(width: 10),


                   ],),
              ),
            ),
            Container(
              height: 300,
              color: Colors.orange,
            ),
            Container(
              height: 200,
              color: Colors.green,
            ),
            Container(
              height: 300,
              color: Colors.purpleAccent.shade100,
            ),
            Container(
              height: 300,
              color: Colors.brown,
            ),

          ],
        ),
      ),
    );
  }
}
