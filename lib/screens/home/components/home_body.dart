import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:abd_shop/screens/home/components/markets_list_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/screens/home/components/product_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../widget/product_widget.dart';
import '../../location/location_page.dart';
import '../../search/search_page.dart';
import 'amazing_item_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  List<Widget> AmazingItem = [AmazingItemWidget()];

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

  supermarket(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SuperMarket(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MarketListWidget(),
                          //   ),
                          // );
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
            Padding(
              padding: EdgeInsets.all(15),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                direction: Axis.horizontal,
                children: [
                  CategoryBox(
                    categorytext: Text("سوپرمارکت"),
                    img: "assets/images/Market.png",
                    ontap: () {
                      supermarket(context);
                    },
                  ),
                  CategoryBox(
                    categorytext: Text("پروتئینی"),
                    img: "assets/images/Protein.png",
                    ontap: () {},
                  ),
                  CategoryBox(
                    categorytext: Text("میوه و سبزیجات"),
                    img: "assets/images/Fruite.png",
                    ontap: () {},
                  ),
                  CategoryBox(
                    categorytext: Text("میوه و سبزیجات"),
                    img: "assets/images/Fruite.png",
                    ontap: () {},
                  ),
                  CategoryBox(
                    categorytext: Text("میوه و سبزیجات"),
                    img: "assets/images/Fruite.png",
                    ontap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("500000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("500000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("500000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("500000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("500000"),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/mahsool.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60, right: 60),
                                  child: FloatingActionButton.extended(
                                    onPressed: () {},
                                    backgroundColor: Colors.orange.shade900,
                                    foregroundColor: Colors.white,
                                    isExtended: true,
                                    shape: const CircleBorder(
                                      eccentricity: 0,
                                    ),
                                    label: Icon(
                                      Icons.add,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("70000"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/toman.png",
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Stack(
                children: [
                  Container(
                    color: Colors.deepOrange,
                  ),
                  ListView(
                      scrollDirection: Axis.horizontal, children: AmazingItem),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            MarketListWidget(),
            SizedBox(
              height: 100,
            ),
            Text(
              "قفسه های سوپرمارکت",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                ItemWrap(
                  image: Image.asset("assets/images/p7.png"),
                  text: "نوشیدنی",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p11.png"),
                  text: "خوار و بار",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p10.png"),
                  text: "پروتئینی",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p15.png"),
                  text: "بازی و سرگرمی",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p12.png"),
                  text: "نان",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p16.png"),
                  text: "دسر و شیرینی",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p13.png"),
                  text: "میوه و سبزیجات",
                ),
                ItemWrap(
                  image: Image.asset("assets/images/p17.png"),
                  text: "نوشت افزار",
                ),
              ],
            ),
          ],
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
      width: 65,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              image,
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWrap extends StatelessWidget {
  const ItemWrap({super.key, required this.image, required this.text});

  final String text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              image,
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
