import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: MyAppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 30),
              color: Colors.white,
              height: 200,
              child: Expanded(
                child: Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Container(
                             margin: EdgeInsets.only(top: 10),
                             width: 70,
                             height: 70,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(50),
                             ),

                             child: Image.asset("assets/images/logo.png",color: Colors.deepOrange,),
                           ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(
                                " جت مارت | ونک ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  " تا 50% ",
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
                             // const SizedBox(width: 7),
                              Text(
                                "4.6",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 7),
                              const SizedBox(width: 7),
                              Text(" + 1000 رای",style: TextStyle(
                                color: Colors.blue,
                              ),),
                            ],
                          ),
                          SizedBox(height: 5),
                           Row(
                             children: [
                               Text(
                            "ارسال در ",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,),),
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
                              fontSize: 14,),
                          ),
                          Text(
                            "6,000 تومان",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold, ),
                          ),
                               ],),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
