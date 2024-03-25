import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("سبد خرید", style: TextStyle(fontSize: 28,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 100,
                height: 100,
                child: Image.asset("assets/images/p8.png"),
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "جت مارت", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold),
                      ),
                      Text("|ونک", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 50,),
                  Row(
                    children: [
                      Icon(Icons.bike_scooter_sharp),
                      SizedBox(width: 5,),
                      Text("6.500 تومان", style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),),
                      SizedBox(width: 10,),
                      Text("45 دقیقه", style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],),
                ],),
            ],),
          Row(
            children: [
             Container(
               margin: EdgeInsets.only(right: 20),
               width: 70,
               height: 70,
               color: Colors.blue,
               child: Image.asset("assets/images/p16.png"),
             ),
              Container(
               // margin: EdgeInsets.only(right: 5),
                width: 70,
                height: 70,
                color: Colors.blue,
                child: Image.asset("assets/images/p12.png"),
              ),
              Container(
                //margin: EdgeInsets.only(right: 5),
                width: 70,
                height: 70,
                color: Colors.blue,
                child: Image.asset("assets/images/p7.png"),
              ),
              Column(
                  children: [
                    Icon(Icons.delete),
                    Text("حذف سبد خرید"),
                  ],),
            ],),
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
                    child: const Text(
                      "ادامه خرید",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
             SizedBox(width: 70,),
              Column(children: [
                Text("جمع سبد خرید (3مورد)"),
                Text("155.300 تومان"),
              ],),
            ],),
        ],),
    );
  }
}
