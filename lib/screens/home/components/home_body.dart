import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/screens/category/fruits_category.dart';
import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:abd_shop/screens/home/components/markets_list_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/screens/home/components/product_modal_sheet.dart';
import 'package:abd_shop/screens/profile/address_page.dart';
import 'package:abd_shop/screens/slider_page/slider_page1.dart';
import 'package:abd_shop/widget/amazing-widget.dart';
import 'package:abd_shop/widget/produt_widget2.dart';
import 'package:abd_shop/widget/provider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../profile/invite_page.dart';
import '../../search/search_page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  //
  // List<Widget> AmazingItem = [
  //   AmazingItemWidget(
  //     onPressed: () {},
  //
  //   ),
  // ];

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
        builder: (context) => AddressPage(),
      ),
    );
  }

  supermarket(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuperMarket(
          market: Market(),
          jetMartAmazingModel: JetMartAmazingModel(),
        ),
      ),
    );
  }

  fruitsCategory(BuildContext context) {
    //TODO: Use CamelCase
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
        builder: (context) => InvitePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                elevation: 2, // Adds a subtle shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  // Inner padding for the card
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                      const SizedBox(width: 15),
                      // Spacing between icon and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "آدرس انتخابی",
                              style: kHeaderTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "آباده، میدان آزادی، کوچه هفتم",
                              style: kHeaderTextStyle2,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          location(context);
                        },
                        child: const Text(
                          "تغییر آدرس",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
// the old code//
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Row(
            //     children: [
            //       const Icon(
            //         Icons.location_on_outlined,
            //         color: kPrimaryColor,
            //         size: 35,
            //       ),
            //       const Column(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(left: 80),
            //             child: Text(
            //               "آدرس انتخابی",
            //               style: kHeaderTextStyle,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Text(
            //             "آباده،میدان آزادی،کوچه هفتم",
            //             style: kHeaderTextStyle2,
            //           ),
            //         ],
            //       ),
            //       const SizedBox(width: 60),
            //       TextButton(
            //         onPressed: () {
            //           location(context);
            //         },
            //         child: const Text(
            //           "تغییر آدرس",
            //           style: TextStyle(color: Colors.blue, fontSize: 15),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
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
            // CategoryListWidget(),     //   The following committed code belongs to the Online category...!!!!!! //
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 140,
              child: ListView(
                children: [
                  Card(
                    elevation: 30,
                    shadowColor: CupertinoColors.systemBlue,
                    margin: EdgeInsets.all(10),
                    child: CategoryBox(
                      CategoryText: const Text(
                        "سوپرمارکت",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/supermarket.png",
                      onTap: () {
                        supermarket(context);
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      fruitsCategory(context);
                    },
                    child: Card(
                      elevation: 30,
                      shadowColor: CupertinoColors.destructiveRed,
                      margin: EdgeInsets.all(10),
                      child: CategoryBox(
                        CategoryText: const Text(
                          "پروتئینی",
                          style: kPrimaryTextStyle,
                        ),
                        img: "assets/images/protein-desktop.png",
                        onTap: () {
                          fruitsCategory(context);
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 30,
                    shadowColor: CupertinoColors.inactiveGray,
                    margin: EdgeInsets.all(10),
                    child: CategoryBox(
                      CategoryText: const Text(
                        "لبنیات",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/dairy-desktop.png",
                    ),
                  ),
                  Card(
                    elevation: 30,
                    shadowColor: CupertinoColors.systemYellow,
                    margin: EdgeInsets.all(10),
                    child: CategoryBox(
                      CategoryText: const Text(
                        "میوه و سبزیجات",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/fruit-desktop.png",
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Card(
                    elevation: 30,
                    shadowColor: CupertinoColors.systemPurple,
                    margin: EdgeInsets.all(10),
                    child: CategoryBox(
                      CategoryText: const Text(
                        "آبمیوه و بستنی",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/icecream-desktop.png",
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: CupertinoColors.activeOrange,
                    margin: EdgeInsets.all(10),
                    child: CategoryBox(
                      CategoryText: const Text(
                        "نانوایی",
                        style: kPrimaryTextStyle,
                      ),
                      img: "assets/images/bread-desktop.png",
                    ),
                  ),
                ],
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      color: Colors.red,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.red,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.red,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.red,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                  ],
                ),
              ),
            ),
            //   The following committed code belongs to the old category...!!!!!! //
            SizedBox(
              height: 40,
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
                                detailtext:
                                    const Text("مغز ران مرغ - یک کیلوگرم"),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("70,000"),
                                    const SizedBox(
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
                                detailtext: const Text(
                                    "کنسرو ماهی تن در روغن زیتون شیلتون - 180 گرم"),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("70,000"),
                                    const SizedBox(
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
                                detailtext:
                                    const Text("تخم مرغ مروارید - 6 عدد"),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("80,000"),
                                    const SizedBox(
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
                                detailtext: const Text(
                                    "ماءالشعیر کلاسیک بهنوش - یک لیتر"),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("44,000"),
                                    const SizedBox(
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
                                detailtext: const Text("نوشابه اسپرایت "),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("70,000"),
                                    const SizedBox(
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
                                detailtext: const Text(
                                    "روغن مایع سرخ‌کردنی بهار - 1.5 لیتر"),
                                pricetext: const Text("50,000"),
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
                                    padding: const EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("87,000"),
                                    const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            const AmazingWidget(),
            const SizedBox(
              height: 20,
            ),
            const MarketListWidget(),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                      color: Colors.deepPurpleAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.deepPurpleAccent,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.deepPurpleAccent,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.deepPurpleAccent,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      color: Colors.teal,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.teal,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.teal,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.teal,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductCard(
                      color: Colors.amber,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.amber,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.amber,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProductCard(
                      color: Colors.amber,
                      image: "assets/images/mahsool1.png",
                      title: 'مرغ ',
                      price: '40000',
                      discountedPrice: '36000',
                      discountPercentage: '10',
                      quantity: '120',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
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
