import 'package:flutter/material.dart';

class MarketItemWidget extends StatefulWidget {
  const MarketItemWidget({super.key});

  @override
  State<MarketItemWidget> createState() => _MarketItemWidgetState();
}

class _MarketItemWidgetState extends State<MarketItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 150,
          //color: Colors.blue,
          child: Row(
            children: [
              CircleAvatar(
                //backgroundColor: Colors.green.shade300,
                radius: 40,
                child: Image.asset("assets/images/flutter.png"),
              ),
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "tittle",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                //margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "50%",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "description",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade500),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 7),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 3),
                                child: Text(
                                  "4.1",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 7),
                              Icon(Icons.directions_bike_rounded),
                              SizedBox(width: 7),
                              Text(
                                "8.500  تومان",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            color: Colors.grey.shade50,
                            child: const Text(
                              "ارسال رایگان برای خرید بالای 20 تومان",
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "45",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "دقیقه",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

