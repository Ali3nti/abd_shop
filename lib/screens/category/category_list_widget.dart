import 'package:abd_shop/global.dart';
import 'package:abd_shop/screens/category/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allCategoriesList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              child: Column(
                children: [
                  CategoryItemWidget(
                    category: allCategoriesList[index],
                    index: index,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
