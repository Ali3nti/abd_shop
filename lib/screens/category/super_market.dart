import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/widget/amazing-widget.dart';
import 'package:abd_shop/widget/category_supermarket_widget.dart';
import 'package:abd_shop/widget/category_products_box_widget.dart';
import 'package:abd_shop/widget/outlined_button_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/product_supermarket_widget.dart';
import 'package:flutter/material.dart';



class SuperMarket extends StatefulWidget {
  const SuperMarket({
    super.key,
    required this.market,
    required this.jetMartAmazingModel,
  });

  final Market market;
  final JetMartAmazingModel jetMartAmazingModel; //TODO: Use CamelCase

  @override
  State<SuperMarket> createState() => _SuperMarketState();
}

class _SuperMarketState extends State<SuperMarket> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBar(),
            ProductSupermarketWidget(
              market: widget.market,
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 5),
                    OutLinedButtonWidget(),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Stack(
                children: [
                  Container(
                    color: kPrimaryColor,
                  ),
                  const AmazingWidget(),
                ],
              ),
            ),
            Container(
              height: 110,
              color: Colors.white,
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    direction: Axis.horizontal,
                    children: [
                      CategorySuperMarket(),
                      CategorySuperMarket(),
                      CategorySuperMarket(),
                      CategorySuperMarket(),
                      CategorySuperMarket(),
                      CategorySuperMarket(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoryProductsBox(),
            const SizedBox(height: 20),
            const CategoryProductsBox(),
            const SizedBox(height: 20),
            const CategoryProductsBox(),
            const SizedBox(height: 20),
            const CategoryProductsBox(),
            const SizedBox(height: 20),
            const CategoryProductsBox(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
