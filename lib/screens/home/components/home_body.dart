import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:abd_shop/screens/home/components/markets_list_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/screens/home/components/product_modal_sheet.dart';
import 'package:abd_shop/screens/slider_page/slider_page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../widget/product_widget.dart';
import '../../category/fruits_category.dart';
import '../../location/location_page.dart';
import '../../profile/invite_page.dart';
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

  List<Widget> AmazingItem = [
    AmazingItemWidget(
      onPressed: () {},
    ),
  ];

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

  fruitscategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FruitsCategory(),
      ),
    );
  }

  sliderPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SliderPage(),
      ),
    );
  }

  sliderPage2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InvitePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
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
                    color: kPrimaryColor,
                    size: 35,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Text(
                          "آدرس انتخابی",
                          style: kHeaderTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "آباده،میدان آزادی،کوچه هفتم",
                        style: kHeaderTextStyle2,
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
                      SliderImage(
                          onTap: () {
                            sliderPage(context);
                          },
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/5cfe6551e1e7aed448bc2fe2878816c02fcd4c0a_1719394303.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                      SliderImage(
                          onTap: () {},
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/ff7c6541fd471b0de113e2bb955e8bfc88d262b6_1719908556.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                      SliderImage(
                          onTap: () {
                            sliderPage2(context);
                          },
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/d73eff9db87cd3fd72be30f49e67a1640dde615e_1717333163.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                      SliderImage(
                          onTap: () {
                            sliderPage2(context);
                          },
                          ImageUrl:
                              "https://dkstatics-public.digikala.com/jet-public/287f806c0a801981f5e085734e9d4273bd1d3299_1718721407.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, bottom: 20),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: const WormEffect(
                        activeDotColor: kPrimaryTextColor,
                        dotHeight: 7,
                        dotWidth: 7),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                children: [
                  CategoryBox(
                    categorytext: Text(
                      "سوپرمارکت",
                      style: kPrimaryTextStyle,
                    ),
                    img: "assets/images/supermarket.png",
                    onTap: () {
                      supermarket(context);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      fruitscategory(context);
                    },
                    child: CategoryBox(
                      categorytext: Text(
                        "پروتئینی",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/protein-desktop.png",
                      onTap: () {
                        fruitscategory(context);
                      },
                    ),
                  ),
                  CategoryBox(
                    categorytext: Text(
                      "لبنیات",
                      style: kPrimaryTextStyle,
                    ),
                    img: "assets/images/dairy-desktop.png",
                  ),
                  CategoryBox(
                    categorytext: Text(
                      "میوه و سبزیجات",
                      style: kPrimaryTextStyle,
                    ),
                    img: "assets/images/fruit-desktop.png",
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  CategoryBox(
                    categorytext: Text(
                      "آبمیوه و بستنی",
                      style: kPrimaryTextStyle,
                    ),
                    img: "assets/images/icecream-desktop.png",
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  CategoryBox(
                    categorytext: Text(
                      "نانوایی",
                      style: kPrimaryTextStyle,
                    ),
                    img: "assets/images/bread-desktop.png",
                  ),
                ],
                scrollDirection: Axis.horizontal,
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
                                imgproduct: "assets/images/mahsool1.png",
                                detailtext: Text("مغز ران مرغ - یک کیلوگرم"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool1.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("70,000"),
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
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool2.png",
                                detailtext: Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool2.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool1",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("70,000"),
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
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool3.png",
                                detailtext: Text("تخم مرغ مروارید - 6 عدد"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool3.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool3",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("80,000"),
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
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool4.png",
                                detailtext:
                                    Text("ماءالشعیر کلاسیک بهنوش - یک لیتر"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool4.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool4",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("44,000"),
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
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool5.png",
                                detailtext: Text("نوشابه اسپرایت "),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool5.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool5",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("70,000"),
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
                      ),
                      InkWell(
                        /*It should be converted to a widget and change its size */
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ProductSheet(
                                imgproduct: "assets/images/mahsool6.png",
                                detailtext:
                                    Text("روغن مایع سرخ‌کردنی بهار - 1.5 لیتر"),
                                pricetext: Text("50,000"),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          height: 11,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/mahsool6.png",
                                    height: 100,
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: FloatingActionButton.extended(
                                      heroTag: "mahsool6",
                                      onPressed: () {},
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      isExtended: true,
                                      shape: const CircleBorder(
                                        eccentricity: 0,
                                      ),
                                      label: Icon(
                                        Icons.add,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("87,000"),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Stack(
                children: [
                  Container(
                    color: kPrimaryColor,
                  ),
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/amazing_daily.png"),
                      AmazingItemWidget(
                        onPressed: () {
                          supermarket(context);
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            supermarket(context);
                          },
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
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            MarketListWidget(),
          ],
        ),
      ),
    );
  }
}

class SliderImage extends StatelessWidget {
  SliderImage({
    super.key,
    required this.ImageUrl,
    required this.onTap,
  });

  void Function()? onTap;
  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10),
            child: Image.network(ImageUrl, fit: BoxFit.fitWidth),
          ),
        ),
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
