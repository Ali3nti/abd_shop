import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/widget/price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FruitsCategory extends StatefulWidget {
  const FruitsCategory({super.key});

  @override
  State<FruitsCategory> createState() => _SuperMarketState();

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  }

class _SuperMarketState extends State<FruitsCategory> {
  @override
  Widget build(BuildContext context) {
    var market;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        scrolledUnderElevation: 0,
        title: GestureDetector(
          onTap: () {
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 30, color: Colors.grey.shade600),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        "جستجو در",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        color: Colors.deepOrange,
                        width: 90,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              color: Colors.white,
              height: 110,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 15),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.asset("assets/images/p7.png"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                     margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "هایپر میوه سایه | ولیعصر",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Text(
                                        "18%",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "میوه و سبزیجات",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      "4.3",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    const Icon(Icons.delivery_dining),
                                    const SizedBox(width: 7),
                                    const PriceWidget(price: 7500,size: Size.large,)
                                  ],
                                ),
                                const Text(
                                  "ارسال رایگان برای خرید بالای 280,000 تومان",
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                             margin: EdgeInsets.only(left: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "45",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "دقیقه",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
