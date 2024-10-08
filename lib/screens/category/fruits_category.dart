import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/widget/product_fruits_category_widget.dart';
import 'package:flutter/material.dart';

class FruitsCategory extends StatefulWidget {
  const FruitsCategory({super.key});

  @override
  State<FruitsCategory> createState() => _SuperMarketState();

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }
}

class _SuperMarketState extends State<FruitsCategory> {
  @override
  Widget build(BuildContext context) {
    var market; //TODO: What is this?!
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const MyAppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            ProductFruitsCategoryWidget(),
            SizedBox(height: 3),
            ProductFruitsCategoryWidget(),
            SizedBox(height: 3),
            ProductFruitsCategoryWidget(),
            SizedBox(height: 3),
            ProductFruitsCategoryWidget(),
            SizedBox(height: 3),
            ProductFruitsCategoryWidget(),
            SizedBox(height: 3),
            ProductFruitsCategoryWidget(),
          ],
        ),
      ),
    );
  }
}
