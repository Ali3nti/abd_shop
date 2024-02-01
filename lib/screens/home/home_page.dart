import 'package:abd_shop/screens/home/search_page.dart';
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

  int index = 0;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: "صفحه اصلی",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket_outlined),
      label: "سبد خرید",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: "حساب",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: "منو",
    ),
  ];

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
                Expanded(
                  child: Row(
                    children: [
                      const Text("جستجو در"),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        color: Colors.green.shade500,
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.green.shade500,
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
                      const SliderImage(
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/5803dca9a4f7e81d5db0d90a82ab98d34af5dc8b_1695207312.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
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
            Wrap(
              children: [
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
                Avatar(
                    image: Image.asset("assets/images/p1.png"),
                    text: "سوپرمارکت"),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green,
          primaryColor: Colors.red,
        ),
        child: BottomNavigationBar(
          items: items,
          currentIndex: index,
          onTap: (indexTap) {
            index = indexTap;
            setState(() {});
          },
        ),
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

class Circle extends StatelessWidget {
  const Circle({super.key, required this.iconData, required this.text});
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData),
        Text(text),
      ],
    );
  }
}
