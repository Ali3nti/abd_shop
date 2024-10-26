import 'package:flutter/material.dart';

class ContinueCartWidget extends StatefulWidget {
  const ContinueCartWidget({super.key});

  @override
  State<ContinueCartWidget> createState() => _ContinueCartWidgetState();
}

class _ContinueCartWidgetState extends State<ContinueCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red.shade200,
      child: Container(
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
                                //color: Colors.orange,
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
                                margin: const EdgeInsets.only(top: 5, left: 40),
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
                  child: Image.asset(
                    "assets/images/jet mart.webp",
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
