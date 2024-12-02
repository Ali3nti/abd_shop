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
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: allCategoriesList
            .map(
              (e) => CategoryItemWidget(category: e),
            )
            .toList(),
      ),
    );
  }
}
