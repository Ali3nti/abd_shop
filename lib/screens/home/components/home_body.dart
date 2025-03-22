import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/product/best_product_list_widget.dart';

import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/category/category_list_widget.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_widget.dart';
import 'package:abd_shop/screens/home/components/app_Bar/app_Bar_Original.dart';
import 'package:abd_shop/screens/home/components/address/current_user_address_widget.dart';
import 'package:abd_shop/product/best_product_widget.dart';
import 'package:abd_shop/screens/home/components/slider_Image/images_slider.dart';
import 'package:abd_shop/screens/market/markets_list_widget.dart';
import 'package:abd_shop/screens/profile/notif_page/notif_page.dart';
import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/product/product_Card_Widget/product_Card_List_Widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentUserAddress(),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarOriginal(),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        notifiPage(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/images/bing.png",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              HomeImagesSlider(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  "قفسه ها",
                  style: kMainTextStyle,
                ),
              ),
              CategoryListWidget(),
              AmazingWidget(),
              SizedBox(
                height: 12,
              ),
              Lottie.asset('assets/images/output.json', width: 170, height: 30),
              ProductCardListWidget(
                categoryId: 1,
              ),
              ProductCardListWidget(
                categoryId: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("پروفروش ترین کالاها",style: kHeaderTextStyle,),
              ),
              BestProductListWidget(),
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
}

void notifiPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NotificationPage(),
    ),
  );
}
