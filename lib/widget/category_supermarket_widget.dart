import 'package:abd_shop/screens/category/fruits_category.dart';
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
            builder: (context) => const FruitsCategory(),
          ),
        );
      },
    );
  }
}
