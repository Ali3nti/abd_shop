import 'package:abd_shop/screens/cart/continue_cart_page.dart';
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
        title: const Text(
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
              margin: const EdgeInsets.only(top: 5),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        width: 60,
                        height: 60,
                        child: Image.asset("assets/images/jet mart.webp"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 220),
                            child: const Row(
                              children: [
                                Text("جت مارت", style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text("|ونک", style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 160),
                            child: const Row(
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
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p16.png"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 1),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p12.png"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 1, left: 10),
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade50,
                          child: Image.asset("assets/images/p7.png"),
                        ),
                        Column(
                          children: [
                            const Icon(Icons.delete),
                            Text("حذف سبد خرید", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,),
                            ),
                          ],),
                      ],),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const ContinueCartPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange.shade900,
                            borderRadius: BorderRadius.circular(5),),
                            margin: const EdgeInsets.only(right: 20),
                            width: 160,
                            height: 40,
                            child: const Center(
                              child: Text("ادامه خرید", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,),
                                ),
                            ),
                           ),
                      ),
                      const SizedBox(width: 100,),
                      Column(
                        children: [
                          Text("جمع سبد خرید (3 مورد)", style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const Text("155.300 تومان", style: TextStyle(
                                fontSize: 13,
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
