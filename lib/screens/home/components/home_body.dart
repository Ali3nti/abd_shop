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
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              AppBarOriginal(),
              CurrentUserAddress(),
              HomeImagesSlider(),
              CategoryListWidget(),
              AmazingWidget(),
              SizedBox(height: 20),
              ProductCardListWidget(
                categoryId: 1,
                categoryName: 'لبنیات',
              ),
              ProductCardListWidget(
                categoryId: 2,
                categoryName: 'آجیل ',
              ),
              MarketListWidget(),
              SizedBox(
                height: 40,
              ),
              SizedBox(
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
}
