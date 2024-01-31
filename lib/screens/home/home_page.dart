import 'package:abd_shop/screens/home/search_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'location_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    search(context);
                  },
                  icon:
                      Icon(Icons.search, size: 30, color: Colors.grey.shade600),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      search(context);
                    },
                    child: Row(
                      children: [
                        const Text("جستجو در"),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          color: Colors.green.shade500,
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.green.shade500,
                      size: 35,
                    ),
                    Column(
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
                    SizedBox(width: 60),
                    TextButton(
                      onPressed: () {
                        location(context);
                      },
                      child: Text(
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
                        SliderImage(
                            ImageUrl:
                                "https://dkstatics-public.digikala.com/jet-public/5803dca9a4f7e81d5db0d90a82ab98d34af5dc8b_1695207312.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                        SliderImage(
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
                ],
              )
            ],
          ),
        ),
      ),
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
      margin: EdgeInsets.all(5),
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
