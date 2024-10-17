import 'package:abd_shop/screens/category/item_category_page.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:flutter/material.dart';

class CategorySuperMarket extends StatefulWidget {
  const CategorySuperMarket({super.key});

  @override
  State<CategorySuperMarket> createState() => _Categor_SuperMarketState();
}

class _Categor_SuperMarketState extends State<CategorySuperMarket> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ItemCategoryPage(),
          ),
        );
      },
      child: CategoryBox(
        CategoryText: const Text("لبنیات و بستنی"),
        img: "assets/images/Market.png",
      ),
    );
  }
}
