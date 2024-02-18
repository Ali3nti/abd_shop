import 'package:flutter/material.dart';

class AmazingItemWidget extends StatefulWidget {
  const AmazingItemWidget({super.key});

  @override
  State<AmazingItemWidget> createState() => _AmazingItemWidgetState();
}

class _AmazingItemWidgetState extends State<AmazingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 350,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 184,
                      child: Image.asset(
                        "assets/images/p1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          //TODO: Create "Add to cart" function
                        },
                        backgroundColor: Colors.orange.shade900,
                        foregroundColor: Colors.white,
                        isExtended: true,
                        shape: const CircleBorder(
                          eccentricity: 0,
                        ),
                        label: const Row(
                          children: [
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   //margin: EdgeInsets.only(top: 50),
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.orange.shade900,
                    //     borderRadius: BorderRadius.circular(100),
                    //   ),
                    //   child: Icon(Icons.add, color: Colors.white, size: 30),
                    // ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text(
                        "پنیر لبنه می ماس",
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text(
                        "300 گرم",
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "37,500",
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Image.asset(
                                'assets/images/toman.png',
                                scale: 5.0,
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            // alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "25 %",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Text(
                        "50,000",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}