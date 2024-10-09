import 'package:abd_shop/screens/category/item_category_page.dart';
import 'package:abd_shop/screens/home/components/category_box_widget.dart';
import 'package:flutter/material.dart';

class Categor_SuperMarket extends StatefulWidget {  //TODO: What?!?!?!?!?!?!?!
  const Categor_SuperMarket({super.key});

  @override
  State<Categor_SuperMarket> createState() => _Categor_SuperMarketState();
}

class _Categor_SuperMarketState extends State<Categor_SuperMarket> {
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
        categoryText: const Text("لبنیات و بستنی"),
        img: "assets/images/Market.png",
      ),
    );
  }
}
