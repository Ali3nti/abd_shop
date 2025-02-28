import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';

import 'package:abd_shop/screens/category/super_market.dart';
import 'package:abd_shop/screens/category/category_list_widget.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_widget.dart';
import 'package:abd_shop/screens/home/components/app_Bar/app_Bar_Original.dart';
import 'package:abd_shop/screens/home/components/address/current_user_address_widget.dart';
import 'package:abd_shop/screens/home/components/slider_Image/images_slider.dart';
import 'package:abd_shop/screens/market/markets_list_widget.dart';
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
                child: AppBarOriginal(),
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
