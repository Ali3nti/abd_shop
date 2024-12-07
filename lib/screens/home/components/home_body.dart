import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/models/product_model.dart';

import 'package:abd_shop/screens/category/fruits_category.dart';
import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/category/category_list_widget.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_widget.dart';
import 'package:abd_shop/screens/home/components/app_Bar/app_Bar_Original.dart';
import 'package:abd_shop/screens/home/components/address/current_user_address_widget.dart';
import 'package:abd_shop/screens/home/components/slider_Image/images_slider.dart';
import 'package:abd_shop/screens/market/markets_list_widget.dart';
import 'package:abd_shop/product/product_modal_sheet.dart';
import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/product/product_Card_Widget/product_Card_List_Widget.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
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
    return Material(
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              AppBarOriginal(),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, right: 60, bottom: 10),
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, right: 60, bottom: 10),
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, right: 60, bottom: 10),
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, right: 60, bottom: 10),
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, right: 60, bottom: 10),
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
                                  detailtext: Text(
                                      "روغن مایع سرخ‌کردنی بهار - 1.5 لیتر"),
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
                                      child: AddToCartWidget(
                                        product: Product(),
                                      ),
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
              ProductCardListWidget(
                categoryId: 1,
                categoryName: 'لبنیات',
              ),
              ProductCardListWidget(
                categoryId: 2,
                categoryName: 'آجیل ',
              ),

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
