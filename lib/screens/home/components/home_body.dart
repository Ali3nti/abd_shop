import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/screens/category/fruits_category.dart';
import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/home/components/category_list_widget.dart';
import 'package:abd_shop/screens/home/components/current_user_address_widget.dart';
import 'package:abd_shop/screens/home/components/images_slider.dart';
import 'package:abd_shop/screens/home/components/markets_list_widget.dart';
import 'package:abd_shop/screens/home/components/product_modal_sheet.dart';
import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/widget/amazing-widget.dart';
import 'package:abd_shop/widget/product_Card_List_Widget.dart';
import 'package:abd_shop/widget/product_card_widget.dart';
import 'package:abd_shop/widget/provider_widget.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future<void> _refreshData() async {
    // کد برای بارگذاری مجدد داده‌ها
    await Future.delayed(const Duration(seconds: 1));
  } // شبیه‌سازی بارگذاری

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  search(context);
                },
                child: Container(
                  height: 50,
                  width: 340,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  // Horizontal padding
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    // Lighter background
                    borderRadius: BorderRadius.circular(10),
                    // More rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Row(
                          children: [
                            const Text(
                              "جستجو در",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/logo.png',
                              color: kPrimaryColor,
                              width: 90,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CurrentUserAddress(),
            const HomeImagesSlider(),
            const CategoryListWidget(),
            const AmazingWidget(),
            const SizedBox(height: 20),
            //   The following committed code belongs to the old category...!!!!!! //
            const SizedBox(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
                              return const ProductSheet(
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
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 60, right: 60, bottom: 10),
                                    child: ProviderWidget(),
                                  ),
                                ],
                              ),
                              Row(
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
            ProductCardListWidget(),
            const MarketListWidget(),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
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
}
