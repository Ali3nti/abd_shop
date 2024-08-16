import 'package:abd_shop/screens/home/components/amazing_product/amazing_list_widget.dart';
import 'package:abd_shop/widget/amazing-widget.dart';
import 'package:abd_shop/widget/categor_supermarket_widget.dart';
import 'package:abd_shop/widget/category_products_box_widget.dart';
import 'package:abd_shop/widget/outlinedbutton_widget.dart';
import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/product_supermarket_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SuperMarket extends StatefulWidget {
  const SuperMarket({super.key});

  @override
  State<SuperMarket> createState() => _SuperMarketState();
}

class _SuperMarketState extends State<SuperMarket> {
  @override
  Widget build(BuildContext context) {
    var large;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBar(),
            const ProductSupermarketWidget(),
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
                      AmazingListWidget(),
                      // AmazingItemWidget(
                      //   onPressed: () {
                      //     supermarket(context);
                      //   },
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: InkWell(
                          onTap: () {
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
                      Categor_SuperMarket(),
                      Categor_SuperMarket(),
                      Categor_SuperMarket(),
                      Categor_SuperMarket(),
                      Categor_SuperMarket(),
                      Categor_SuperMarket(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const CategorProductyBox(),
            const SizedBox(height: 20),
            const CategorProductyBox(),
            const SizedBox(height: 20),
          const CategorProductyBox(),
            const SizedBox(height: 20),
      const CategorProductyBox(),
            const SizedBox(height: 20),
            const CategorProductyBox(),
            const SizedBox(height: 20),
          ],),
      ),
    );
  }
}
