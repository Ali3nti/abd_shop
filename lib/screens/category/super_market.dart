import 'package:abd_shop/screens/category/all_page.dart';
import 'package:abd_shop/screens/category/item_category_page.dart';
import 'package:abd_shop/screens/home/components/amazing_item_widget.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
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
      backgroundColor: Colors.grey.shade50,
      // appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBar(),
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Colors.white,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      "assets/images/logo.png",
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        " جت مارت | ونک ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          " تا50% ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 18,
                      ),
                      const Text(
                        "4.6   . ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        " + 1000 رای",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "ارسال در ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                      const Text(
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
                      const Text(
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
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    OutlinedButton(
                        style:
                            OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Text(
                          "میوه",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "صیفی جات",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "سبزیجات",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "میوه خاص",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "میوه و صیفی جات اقتصادی",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "ادویه و چاشنی ها",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "ترشیجات و شوریجات",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "آبمیوه طبیعی",
                        )),
                    const SizedBox(width: 5),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "کمپوت و کنسویجات",
                        )),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 400,
              color: Color(0xffff6200),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 400,
                      color: Color(0xffff6200),
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const Text(
                              "شگفت",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              "انگیزهای",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              "امروز",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
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
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AllPage(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right: 60),
                                //height: 30,
                                child: const Row(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AmazingItemWidget(),
                    SizedBox(
                      width: 10,
                    ),
                    AmazingItemWidget(),
                    SizedBox(
                      width: 10,
                    ),
                    AmazingItemWidget(),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 300,
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                size: 60,
                                CupertinoIcons.arrow_left_circle_fill,
                                color: Color.fromARGB(500, 255, 98, 0),
                              ),
                              Text(
                                "مشاهده همه",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(500, 255, 98, 0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 110,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    direction: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItemCategoryPage(),
                            ),
                          );
                        },
                        child: CategoryBox(
                          categorytext: const Text("لبنیات و بستنی"),
                          img: "assets/images/Market.png",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItemCategoryPage(),
                            ),
                          );
                        },
                        child: CategoryBox(
                          categorytext: const Text("تنقلات"),
                          img: "assets/images/p8.png",
                        ),
                      ),
                      CategoryBox(
                        categorytext: const Text("نوشیدنی"),
                        img: "assets/images/p7.png",
                      ),
                      CategoryBox(
                        categorytext: const Text("نان"),
                        img: "assets/images/p12.png",
                      ),
                      CategoryBox(
                        categorytext: const Text("خواربار"),
                        img: "assets/images/p11.png",
                      ),
                      CategoryBox(
                        categorytext: const Text("میوه و سبزیجات"),
                        img: "assets/images/Fruite.png",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 390,
              color: Color(0xffff6200),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        "حراج روز",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "همه",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                      const Icon(Icons.navigate_next, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xffff6200),
              height: 390,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "لبنیات و بستنی",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 250,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "همه",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                      const Icon(Icons.navigate_next, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 390,
              color: Color(0xffff6200),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "تنقلات",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 290,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "همه",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                      const Icon(Icons.navigate_next, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 390,
              color: Color(0xffff6200),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "نوشیدنی",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 270,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "همه",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                      const Icon(Icons.navigate_next, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        AmazingItemWidget(),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 300,
                              width: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    size: 60,
                                    CupertinoIcons.arrow_left_circle_fill,
                                    color: Color.fromARGB(500, 255, 98, 0),
                                  ),
                                  Text(
                                    "مشاهده همه",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(500, 255, 98, 0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
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
