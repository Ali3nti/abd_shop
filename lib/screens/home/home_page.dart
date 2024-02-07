import 'package:abd_shop/screens/home/search_page.dart';
import 'package:abd_shop/screens/test.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'location_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.9);

  int currentIndex = 0;

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  location(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationPage(),
      ),
    );
  }

  // int index = 0;     // old navigationbar
  //
  // List<BottomNavigationBarItem> items = const [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.shopping_basket_outlined),
  //     label: "سبد خرید",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home_filled),
  //     label: "صفحه اصلی",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.person_outline),
  //     label: "حساب",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.menu),
  //     label: "منو",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        scrolledUnderElevation: 0,
        title: GestureDetector(
          onTap: () {
            search(context);
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.deepOrange,
                    size: 35,
                  ),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Text(
                          "آدرس انتخابی",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "آباده،میدان آزادی،کوچه هفتم",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 60),
                  TextButton(
                    onPressed: () {
                      location(context);
                    },
                    child: const Text(
                      "تغییر آدرس",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: 150,
                  child: PageView(
                    controller: pageController,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestPage(),
                            ),
                          );
                        },
                        child: const SliderImage(
                            ImageUrl:
                                "https://dkstatics-public.digikala.com/jet-public/5803dca9a4f7e81d5db0d90a82ab98d34af5dc8b_1695207312.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                      ),
                      const SliderImage(
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/216954b9069c9c07b50e24f2f6fbd1c4628a46b6_1695206052.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 20),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: const WormEffect(
                        activeDotColor: Colors.black,
                        dotHeight: 7,
                        dotWidth: 7),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p2.png"),
                    text: "میوه و سبزیجات"),
                Avatar(
                    image: Image.asset("assets/images/p3.png"),
                    text: "پروتئینی"),
                Avatar(
                    image: Image.asset("assets/images/p4.png"),
                    text: "نانوایی"),
                Avatar(
                    image: Image.asset("assets/images/p5.png"),
                    text: "شیرینی و آجیل"),
                Avatar(
                    image: Image.asset("assets/images/p6.png"),
                    text: "آب میوه و بستنی"),
                Avatar(
                    image: Image.asset("assets/images/p6.png"),
                    text: "گل و گیاه"),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.black,
                    height: 300,
                    width: 200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.red,
                    height: 300,
                    width: 200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 300,
                    width: 200,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 300,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("نمایش همه موارد"),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_circle_down))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("خانه"),
              activeColor: Colors.deepOrangeAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.add_card),
              title: Text("سفارشات"),
              activeColor: Colors.blue),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              title: Text("سبد خرید"),
              activeColor: Colors.purple),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text("پروفایل"),
              activeColor: Colors.green),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.green.shade500,
      //   height: 50,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Circle(iconData: Icons.home_filled, text: "صفحه اصلی"),
      //       Circle(
      //           iconData: Icons.shopping_basket_outlined, text: "سبد خرید"),
      //       Circle(iconData: Icons.person_outline, text: "حساب"),
      //       Circle(iconData: Icons.menu, text: "منو"),
      //     ],
      //   ),
      // ),
    );
  }
}

class SliderImage extends StatelessWidget {
  const SliderImage({
    super.key,
    required this.ImageUrl,
  });
  final String ImageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(10),
        child: Image.network(ImageUrl, fit: BoxFit.fitWidth),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.image, required this.text});

  final String text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      child: Column(
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            child: TextButton(onPressed: () {}, child: image),
          ),
          TextButton(
            onPressed: () {},
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
